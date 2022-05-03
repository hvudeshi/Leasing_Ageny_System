class ChangeApplicationColumn < ActiveRecord::Migration[6.1]
  def change
    change_column :applications, :application_id, :integer
  end
end
