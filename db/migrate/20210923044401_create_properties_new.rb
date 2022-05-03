class CreatePropertiesNew < ActiveRecord::Migration[6.1]
  def change
    create_table :properties, :id=>false do |t|
      t.integer :property_id, primary_key: true
      t.string :name
      t.string :property_type
      t.integer :number_of_units
      t.integer :agent
      t.string :size
      t.string :address
      t.boolean :parking
      t.boolean :pet_allowed
      t.integer :number_of_rooms
      t.integer :number_of_bathrooms
      t.boolean :laundry
      t.string :terms_available
      t.date :earliest_start_date
      t.float :application_fee
      t.float :monthly_rent
      t.integer :occupied_by
    end
    add_foreign_key :properties, :users, column: :agent, primary_key: "user_id"
    add_foreign_key :properties, :users, column: :occupied_by, primary_key: "user_id"
  end
end
