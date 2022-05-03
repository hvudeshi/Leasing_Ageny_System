class ApplicationsController < ApplicationController
  before_action :set_application, only: %i[ show edit update destroy ]

  # GET /applications or /applications.json
  def index
    @applications = Application.all
  end

  # GET /applications/1 or /applications/1.json
  def show
  end

  # GET /applications/new
  def new
    @application = Application.new
  end

  # GET /applications/1/edit
  def edit
  end

  # POST /applications or /applications.json
  def create
    @application = Application.new(application_params)
    begin
      @user = User.find(application_params[:applicant_id])
      begin
        if Application.where(applicant_id: application_params[:applicant_id], property_id: application_params[:property_id], status: "Applied").count != 0
          respond_to do |format|
            @application.errors.add(:base, "Applicant has already applied!")
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @user.errors, status: :unprocessable_entity }
          end
        elsif Application.where(applicant_id: application_params[:applicant_id], property_id: application_params[:property_id], status: "Checkin").count != 0
          respond_to do |format|
            @application.errors.add(:base, "Applicant has already CheckedIn!")
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @user.errors, status: :unprocessable_entity }
          end
        else
          respond_to do |format|
            if @user[:user_type] != "Applicant"
              @application.errors.add(:base, "Property cannot be assigned to Admins or Agents")
              format.html { render :new, status: :unprocessable_entity }
              format.json { render json: @user.errors, status: :unprocessable_entity }
            else
              if @application.save
                format.html { redirect_to @application, notice: "Application was successfully created." }
                format.json { render :show, status: :created, location: @application }
              else
                format.html { render :new, status: :unprocessable_entity }
                format.json { render json: @application.errors, status: :unprocessable_entity }
              end
            end
          end
        end
      rescue
        respond_to do |format|
          if @user[:user_type] != "Applicant"
            @application.errors.add(:base, "Property cannot be assigned to Admins or Agents")
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @user.errors, status: :unprocessable_entity }
          else
            if @application.save
              format.html { redirect_to @application, notice: "Application was successfully created." }
              format.json { render :show, status: :created, location: @application }
            else
              format.html { render :new, status: :unprocessable_entity }
              format.json { render json: @application.errors, status: :unprocessable_entity }
            end
          end
        end
      end
    rescue
      respond_to do |format|
        @application.errors.add(:base, "Applicant must exist!")
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /applications/1 or /applications/1.json
  def update
    respond_to do |format|
      if current_user.user_type == 'Applicant'
        if is_valid_application_for_applicant
          format.html { redirect_to @application, notice: "Status is successfully updated" }
          format.json { render :show, status: :ok, location: @application }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @application.errors, status: :unprocessable_entity }
        end
      else
        if is_valid_application_agent_or_admin
          if @application.update(application_params)
            format.html { redirect_to @application, notice: "Application was successfully updated." }
            format.json { render :show, status: :ok, location: @application }
          else
            format.html { render :edit, status: :unprocessable_entity }
            format.json { render json: @application.errors, status: :unprocessable_entity }
          end
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @application.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /applications/1 or /applications/1.json
  def destroy
    @application.destroy
    respond_to do |format|
      format.html { redirect_to applications_url, notice: "Application was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def is_valid_application_agent_or_admin
    invalid_check_out_status = %w[Applied Rejected Withdraw]
    invalid_check_in_status = %w[Rejected Withdraw Checkout]
    invalid_applied_status = %w[Rejected Withdraw Checkout Checkin]
    invalid_rejected_status = %w[Withdraw Checkin Checkout]
    invalid_application_update = %w[Withdraw Rejected Checkout]

    @property_details = Property.find(application_params[:property_id])
    if invalid_application_update.include?@application[:status]
      @application.errors.add(:base, "Current status of application is #{@application[:status]}. Cannot update the application anymore.")
      return false
    end
    if invalid_applied_status.include?@application[:status] and application_params[:status] == 'Applied'
      @application.errors.add(:base, "Cannot change the status to applied now.")
      return false
    end
    if invalid_check_in_status.include?@application[:status] and application_params[:status] == 'Checkin'
      @application.errors.add(:base, "Cannot Checkin now. Current Application status: #{@application[:status]}")
      return false
    end
    if invalid_check_out_status.include?@application[:status] and application_params[:status] == 'Checkout'
      @application.errors.add(:base, "Cannot Checkout now. Current Application status: #{@application[:status]}")
      return false
    end
    if invalid_rejected_status.include?@application[:status] and application_params[:status] == 'Rejected'
      @application.errors.add(:base, "Cannot Reject the application now. Current Application status: #{@application[:status]}")
      return false
    end
    if (current_user.user_type == 'Agent' or current_user.user_type == 'Admin') and application_params[:status] == 'Withdraw'
      @application.errors.add(:base, "Agent or Admin cannot withdraw the application.")
      return false
    end


    if application_params[:status] == 'Checkout'
      @property_details.update({:occupied_by=>nil})
      return true
    end

    if application_params[:status] == 'Checkin'
      if !@property_details[:occupied_by].nil?
        @application.errors.add(:base, "Property already occupied.")
        return false
      else
        @property_details.update({:occupied_by=>@application[:applicant_id]})
        return true
      end
    end
    true
  end

  def is_valid_application_for_applicant
    @property_details = Property.find(application_params[:property_id])
      if @application[:status] == 'Applied'
        @application.update({:status=>'Withdraw'})
        return true
      elsif @application[:status] == 'Checkin'
        @application.update({:status=>'Checkout'})
        @property_details.update({:occupied_by=>nil})
        return true
      end
  end

  def is_already_occupied
    @property_details = Property.find(application_params[:property_id])
    if !@property_details[:occupied_by].nil?
      @application.errors.add(:base, "Property already occupied.")
      false
    else
      true
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_application
      @application = Application.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def application_params
      params.require(:application).permit(:application_id, :applicant_id, :property_id, :applied_date, :status)
    end
end
