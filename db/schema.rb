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

ActiveRecord::Schema.define(version: 2020_07_24_202824) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "academic_cycles", force: :cascade do |t|
    t.string "code", limit: 16
    t.string "name", limit: 255
    t.text "description"
    t.bigint "cycle_type_id", null: false
    t.bigint "status_id", null: false
    t.date "start"
    t.date "finish"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cycle_type_id"], name: "index_academic_cycles_on_cycle_type_id"
    t.index ["status_id"], name: "index_academic_cycles_on_status_id"
  end

  create_table "attendance_types", force: :cascade do |t|
    t.string "code", limit: 16
    t.string "name", limit: 255
    t.text "description"
    t.bigint "status_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["status_id"], name: "index_attendance_types_on_status_id"
  end

  create_table "buildings", force: :cascade do |t|
    t.string "code", limit: 16
    t.text "description"
    t.bigint "campus_id", null: false
    t.bigint "status_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["campus_id"], name: "index_buildings_on_campus_id"
    t.index ["status_id"], name: "index_buildings_on_status_id"
  end

  create_table "campuses", force: :cascade do |t|
    t.string "code", limit: 16
    t.string "name", limit: 255
    t.text "description"
    t.bigint "institution_id", null: false
    t.bigint "status_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["institution_id"], name: "index_campuses_on_institution_id"
    t.index ["status_id"], name: "index_campuses_on_status_id"
  end

  create_table "careers", force: :cascade do |t|
    t.string "code", limit: 16
    t.string "name", limit: 255
    t.text "description"
    t.bigint "status_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["status_id"], name: "index_careers_on_status_id"
  end

  create_table "classrooms", force: :cascade do |t|
    t.string "code", limit: 16
    t.text "description"
    t.bigint "building_id", null: false
    t.bigint "status_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["building_id"], name: "index_classrooms_on_building_id"
    t.index ["status_id"], name: "index_classrooms_on_status_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string "name", null: false
    t.string "iso_code", limit: 4, null: false
    t.string "calling_code", limit: 10
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["iso_code"], name: "index_countries_on_iso_code", unique: true
  end

  create_table "courses", force: :cascade do |t|
    t.string "code", limit: 16
    t.string "name", limit: 255
    t.text "description"
    t.integer "credits", limit: 2
    t.bigint "status_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["status_id"], name: "index_courses_on_status_id"
  end

  create_table "cycle_types", force: :cascade do |t|
    t.string "code", limit: 16
    t.string "name", limit: 255
    t.text "description"
    t.integer "duration", limit: 2
    t.bigint "status_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["status_id"], name: "index_cycle_types_on_status_id"
  end

  create_table "educative_levels", force: :cascade do |t|
    t.string "code", limit: 16
    t.string "name", limit: 255
    t.text "description"
    t.bigint "status_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["status_id"], name: "index_educative_levels_on_status_id"
  end

  create_table "evaluation_periods", force: :cascade do |t|
    t.string "code", limit: 16
    t.string "name", limit: 255
    t.text "description"
    t.bigint "status_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["status_id"], name: "index_evaluation_periods_on_status_id"
  end

  create_table "grades", force: :cascade do |t|
    t.string "code", limit: 16
    t.string "name", limit: 255
    t.text "description"
    t.bigint "status_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["status_id"], name: "index_grades_on_status_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "code", limit: 16
    t.string "name", limit: 255
    t.text "description"
    t.bigint "status_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["status_id"], name: "index_groups_on_status_id"
  end

  create_table "institutions", force: :cascade do |t|
    t.string "code", limit: 16
    t.string "name", limit: 255
    t.text "description"
    t.bigint "status_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["status_id"], name: "index_institutions_on_status_id"
  end

  create_table "modalities", force: :cascade do |t|
    t.string "code", limit: 16
    t.string "name", limit: 255
    t.text "description"
    t.bigint "status_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["status_id"], name: "index_modalities_on_status_id"
  end

  create_table "relationships", force: :cascade do |t|
    t.string "name", limit: 255
    t.bigint "status_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["status_id"], name: "index_relationships_on_status_id"
  end

  create_table "statuses", force: :cascade do |t|
    t.string "code", limit: 16
    t.string "name", limit: 255
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "syllabuses", force: :cascade do |t|
    t.string "code", limit: 16
    t.string "name", limit: 255
    t.text "description"
    t.integer "approval_credits", limit: 2
    t.bigint "status_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["status_id"], name: "index_syllabuses_on_status_id"
  end

  create_table "turns", force: :cascade do |t|
    t.string "code", limit: 16
    t.string "name", limit: 255
    t.text "description"
    t.bigint "status_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["status_id"], name: "index_turns_on_status_id"
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

  add_foreign_key "academic_cycles", "cycle_types"
  add_foreign_key "academic_cycles", "statuses"
  add_foreign_key "attendance_types", "statuses"
  add_foreign_key "buildings", "campuses"
  add_foreign_key "buildings", "statuses"
  add_foreign_key "campuses", "institutions"
  add_foreign_key "campuses", "statuses"
  add_foreign_key "careers", "statuses"
  add_foreign_key "classrooms", "buildings"
  add_foreign_key "classrooms", "statuses"
  add_foreign_key "courses", "statuses"
  add_foreign_key "cycle_types", "statuses"
  add_foreign_key "educative_levels", "statuses"
  add_foreign_key "evaluation_periods", "statuses"
  add_foreign_key "grades", "statuses"
  add_foreign_key "groups", "statuses"
  add_foreign_key "institutions", "statuses"
  add_foreign_key "modalities", "statuses"
  add_foreign_key "relationships", "statuses"
  add_foreign_key "syllabuses", "statuses"
  add_foreign_key "turns", "statuses"
end
