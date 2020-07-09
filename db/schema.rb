# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_07_08_104626) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "academic_years", force: :cascade do |t|
    t.bigint "campu_id", null: false
    t.date "start", null: false
    t.date "finish", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["campu_id"], name: "index_academic_years_on_campu_id"
    t.index ["start", "finish", "campu_id"], name: "uidx_academic_year", unique: true
  end

  create_table "campus", force: :cascade do |t|
    t.bigint "school_id", null: false
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["school_id"], name: "index_campus_on_school_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string "name", null: false
    t.string "iso_code", limit: 4, null: false
    t.string "calling_code", limit: 10
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["iso_code"], name: "index_countries_on_iso_code", unique: true
  end

  create_table "schools", force: :cascade do |t|
    t.string "name", null: false
    t.string "code", limit: 64, null: false
    t.bigint "country_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["code"], name: "index_schools_on_code", unique: true
    t.index ["country_id"], name: "index_schools_on_country_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.string "second_last_name"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["first_name"], name: "index_users_on_first_name"
    t.index ["last_name"], name: "index_users_on_last_name"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  add_foreign_key "academic_years", "campus"
  add_foreign_key "campus", "schools"
  add_foreign_key "schools", "countries"
end
