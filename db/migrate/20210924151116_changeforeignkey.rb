class Changeforeignkey < ActiveRecord::Migration[6.1]
  def change

    remove_foreign_key :properties, :users, column: :agent
    remove_foreign_key :properties, :users, column: :occupied_by
    remove_foreign_key :applications , :users, column: :applicant_id
    remove_foreign_key :applications, :properties, column: :property_id

    add_foreign_key :properties, :users, column: :agent, primary_key: :user_id, on_delete: :nullify
    add_foreign_key :properties, :users, column: :occupied_by, primary_key: :user_id, on_delete: :nullify
    add_foreign_key :applications, :users, column: :applicant_id, primary_key: :user_id, on_delete: :cascade
    add_foreign_key :applications, :properties, column: :property_id, primary_key: :property_id, on_delete: :cascade

  end
end
