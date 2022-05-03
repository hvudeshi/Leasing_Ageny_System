class CreateApplicationNew < ActiveRecord::Migration[6.1]
  def change
    create_table :applications, :id=>false do |t|
      t.string :application_id, primary_key: true
      t.integer :applicant_id
      t.integer :property_id
      t.datetime :applied_date
      t.string :status
      t.timestamps
    end
    add_foreign_key :applications, :users, column: :applicant_id, primary_key: "user_id"
    add_foreign_key :applications, :properties, column: :property_id, primary_key: "property_id"
  end
end
