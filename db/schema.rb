# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_09_24_151634) do

  create_table "applications", primary_key: "application_id", force: :cascade do |t|
    t.integer "applicant_id"
    t.integer "property_id"
    t.datetime "applied_date"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "properties", primary_key: "property_id", force: :cascade do |t|
    t.string "name"
    t.string "property_type"
    t.integer "number_of_units"
    t.integer "agent"
    t.string "size"
    t.string "address"
    t.boolean "parking"
    t.boolean "pet_allowed"
    t.integer "number_of_rooms"
    t.integer "number_of_bathrooms"
    t.boolean "laundry"
    t.string "terms_available"
    t.date "earliest_start_date"
    t.float "application_fee"
    t.float "monthly_rent"
    t.integer "occupied_by"
  end

  create_table "users", primary_key: "user_id", force: :cascade do |t|
    t.string "name"
    t.string "email_address"
    t.string "password_digest"
    t.string "user_type"
    t.string "address"
    t.string "phone_number"
    t.index ["email_address"], name: "index_users_on_email_address", unique: true
  end

  add_foreign_key "applications", "properties", primary_key: "property_id", on_delete: :cascade
  add_foreign_key "applications", "users", column: "applicant_id", primary_key: "user_id", on_delete: :cascade
  add_foreign_key "properties", "users", column: "agent", primary_key: "user_id", on_delete: :nullify
  add_foreign_key "properties", "users", column: "occupied_by", primary_key: "user_id", on_delete: :nullify
end
