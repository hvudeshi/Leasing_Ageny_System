class CreateTables < ActiveRecord::Migration[6.1]
  def change
    create_table :users, :id=>false do |t|
      t.integer :user_id, primary_key: true
      t.string :name
      t.string :email_address
      t.string :password
      t.string :user_type
      t.string :address
      t.string :phone_number
    end
    add_index :users, :email_address, unique: true
  end
end
