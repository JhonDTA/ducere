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

ActiveRecord::Schema.define(version: 2020_08_26_064607) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "academic_cycles", force: :cascade do |t|
    t.string "code", limit: 16, null: false
    t.string "name", limit: 255, null: false
    t.text "description"
    t.bigint "cycle_type_id", null: false
    t.bigint "status_id", null: false
    t.date "start", null: false
    t.date "finish", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["code"], name: "uidx_academic_cycles_code", unique: true
    t.index ["cycle_type_id"], name: "index_academic_cycles_on_cycle_type_id"
    t.index ["status_id"], name: "index_academic_cycles_on_status_id"
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "addresses", force: :cascade do |t|
    t.bigint "settlement_id", null: false
    t.string "street", limit: 255, null: false
    t.string "interior_number", limit: 50
    t.string "exterior_number", limit: 50
    t.text "reference"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["settlement_id"], name: "index_addresses_on_settlement_id"
  end

  create_table "attendance_types", force: :cascade do |t|
    t.string "code", limit: 16, null: false
    t.string "name", limit: 255, null: false
    t.text "description"
    t.bigint "status_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["code"], name: "uidx_attendance_types_code", unique: true
    t.index ["status_id"], name: "index_attendance_types_on_status_id"
  end

  create_table "buildings", force: :cascade do |t|
    t.string "code", limit: 16, null: false
    t.text "description"
    t.bigint "campus_id", null: false
    t.bigint "status_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["campus_id", "code"], name: "uidx_buildings_campus_code", unique: true
    t.index ["campus_id"], name: "index_buildings_on_campus_id"
    t.index ["status_id"], name: "index_buildings_on_status_id"
  end

  create_table "campus_addresses", force: :cascade do |t|
    t.bigint "campus_id", null: false
    t.bigint "address_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["address_id"], name: "index_campus_addresses_on_address_id"
    t.index ["campus_id", "address_id"], name: "uidx_campus_address", unique: true
    t.index ["campus_id"], name: "index_campus_addresses_on_campus_id"
  end

  create_table "campus_evaluations", force: :cascade do |t|
    t.bigint "campus_id", null: false
    t.bigint "turn_evaluation_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["campus_id", "turn_evaluation_id"], name: "uidx_campus_evaluations", unique: true
    t.index ["campus_id"], name: "index_campus_evaluations_on_campus_id"
    t.index ["turn_evaluation_id"], name: "index_campus_evaluations_on_turn_evaluation_id"
  end

  create_table "campuses", force: :cascade do |t|
    t.string "code", limit: 16, null: false
    t.string "name", limit: 255, null: false
    t.text "description"
    t.bigint "institution_id", null: false
    t.bigint "status_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["institution_id", "code"], name: "uidx_campuses_institution_code", unique: true
    t.index ["institution_id"], name: "index_campuses_on_institution_id"
    t.index ["status_id"], name: "index_campuses_on_status_id"
  end

  create_table "career_syllabuses", force: :cascade do |t|
    t.bigint "career_id", null: false
    t.bigint "syllabus_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["career_id", "syllabus_id"], name: "uidx_career_syllabuses", unique: true
    t.index ["career_id"], name: "index_career_syllabuses_on_career_id"
    t.index ["syllabus_id"], name: "index_career_syllabuses_on_syllabus_id"
  end

  create_table "careers", force: :cascade do |t|
    t.string "code", limit: 16, null: false
    t.string "name", limit: 255, null: false
    t.text "description"
    t.bigint "educative_level_id", null: false
    t.bigint "status_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["code"], name: "uidx_careers_code", unique: true
    t.index ["educative_level_id"], name: "index_careers_on_educative_level_id"
    t.index ["status_id"], name: "index_careers_on_status_id"
  end

  create_table "classrooms", force: :cascade do |t|
    t.string "code", limit: 16, null: false
    t.text "description"
    t.bigint "building_id", null: false
    t.bigint "status_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["building_id", "code"], name: "uidx_classrooms_building_code", unique: true
    t.index ["building_id"], name: "index_classrooms_on_building_id"
    t.index ["status_id"], name: "index_classrooms_on_status_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string "name", null: false
    t.string "iso_code", limit: 4, null: false
    t.string "calling_code", limit: 10
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["iso_code"], name: "uidx_countries_iso_code", unique: true
  end

  create_table "course_evaluations", force: :cascade do |t|
    t.bigint "grade_course_id", null: false
    t.bigint "campus_evaluation_id", null: false
    t.bigint "professor_id", null: false
    t.bigint "group_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["campus_evaluation_id"], name: "index_course_evaluations_on_campus_evaluation_id"
    t.index ["grade_course_id", "campus_evaluation_id", "professor_id", "group_id"], name: "uidx_course_evaluations", unique: true
    t.index ["grade_course_id"], name: "index_course_evaluations_on_grade_course_id"
    t.index ["group_id"], name: "index_course_evaluations_on_group_id"
    t.index ["professor_id"], name: "index_course_evaluations_on_professor_id"
  end

  create_table "course_homeworks", force: :cascade do |t|
    t.bigint "course_evaluation_id", null: false
    t.string "name", limit: 255, null: false
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["course_evaluation_id"], name: "index_course_homeworks_on_course_evaluation_id"
  end

  create_table "course_marks", force: :cascade do |t|
    t.bigint "student_course_id", null: false
    t.float "mark", default: 10.0, null: false
    t.integer "attendance", limit: 2, default: 0, null: false
    t.text "observations"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["student_course_id"], name: "index_course_marks_on_student_course_id"
    t.index ["student_course_id"], name: "uidx_course_marks", unique: true
  end

  create_table "courses", force: :cascade do |t|
    t.string "code", limit: 16, null: false
    t.string "name", limit: 255, null: false
    t.text "description"
    t.integer "credits", limit: 2, default: 0, null: false
    t.bigint "status_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["code"], name: "uidx_courses_code", unique: true
    t.index ["status_id"], name: "index_courses_on_status_id"
  end

  create_table "currencies", force: :cascade do |t|
    t.string "iso_code", limit: 3, null: false
    t.string "name", limit: 255, null: false
    t.string "symbol", limit: 8, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["iso_code"], name: "uidx_currencies_index", unique: true
  end

  create_table "cycle_modalities", force: :cascade do |t|
    t.bigint "academic_cycle_id", null: false
    t.bigint "modality_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["academic_cycle_id", "modality_id"], name: "uidx_cycle_modalities", unique: true
    t.index ["academic_cycle_id"], name: "index_cycle_modalities_on_academic_cycle_id"
    t.index ["modality_id"], name: "index_cycle_modalities_on_modality_id"
  end

  create_table "cycle_turns", force: :cascade do |t|
    t.bigint "cycle_modality_id", null: false
    t.bigint "turn_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cycle_modality_id", "turn_id"], name: "uidx_cycle_turns", unique: true
    t.index ["cycle_modality_id"], name: "index_cycle_turns_on_cycle_modality_id"
    t.index ["turn_id"], name: "index_cycle_turns_on_turn_id"
  end

  create_table "cycle_types", force: :cascade do |t|
    t.string "code", limit: 16, null: false
    t.string "name", limit: 255, null: false
    t.text "description"
    t.integer "duration", limit: 2, default: 0, null: false
    t.bigint "status_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["code"], name: "uidx_cycle_types_code", unique: true
    t.index ["status_id"], name: "index_cycle_types_on_status_id"
  end

  create_table "educative_levels", force: :cascade do |t|
    t.string "code", limit: 16, null: false
    t.string "name", limit: 255, null: false
    t.text "description"
    t.bigint "status_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["code"], name: "uidx_edicative_levels_code", unique: true
    t.index ["status_id"], name: "index_educative_levels_on_status_id"
  end

  create_table "evaluation_attendances", force: :cascade do |t|
    t.bigint "student_course_id", null: false
    t.bigint "attendance_type_id", null: false
    t.date "date", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["attendance_type_id"], name: "index_evaluation_attendances_on_attendance_type_id"
    t.index ["student_course_id", "attendance_type_id", "date"], name: "uidx_evaluation_attendances", unique: true
    t.index ["student_course_id"], name: "index_evaluation_attendances_on_student_course_id"
  end

  create_table "evaluation_periods", force: :cascade do |t|
    t.string "code", limit: 16, null: false
    t.string "name", limit: 255, null: false
    t.text "description"
    t.bigint "status_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["code"], name: "uidx_evaluation_periods_code", unique: true
    t.index ["status_id"], name: "index_evaluation_periods_on_status_id"
  end

  create_table "grade_courses", force: :cascade do |t|
    t.bigint "syllabus_grade_id", null: false
    t.bigint "course_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["course_id"], name: "index_grade_courses_on_course_id"
    t.index ["syllabus_grade_id", "course_id"], name: "uidx_grade_courses", unique: true
    t.index ["syllabus_grade_id"], name: "index_grade_courses_on_syllabus_grade_id"
  end

  create_table "grades", force: :cascade do |t|
    t.string "code", limit: 16, null: false
    t.string "name", limit: 255, null: false
    t.text "description"
    t.bigint "status_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["code"], name: "uidx_gardes_code", unique: true
    t.index ["status_id"], name: "index_grades_on_status_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "code", limit: 16, null: false
    t.string "name", limit: 255, null: false
    t.text "description"
    t.bigint "status_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["code"], name: "uidx_groups_code", unique: true
    t.index ["status_id"], name: "index_groups_on_status_id"
  end

  create_table "homework_marks", force: :cascade do |t|
    t.bigint "student_homework_id", null: false
    t.float "mark", default: 10.0, null: false
    t.text "observations"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["student_homework_id"], name: "index_homework_marks_on_student_homework_id"
    t.index ["student_homework_id"], name: "uidx_homework_marks", unique: true
  end

  create_table "institutions", force: :cascade do |t|
    t.string "code", limit: 16, null: false
    t.string "name", limit: 255, null: false
    t.text "description"
    t.bigint "status_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["code"], name: "uidx_institutions_code", unique: true
    t.index ["status_id"], name: "index_institutions_on_status_id"
  end

  create_table "instution_addresses", force: :cascade do |t|
    t.bigint "institution_id", null: false
    t.bigint "address_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["address_id"], name: "index_instution_addresses_on_address_id"
    t.index ["institution_id", "address_id"], name: "uidx_institution_address", unique: true
    t.index ["institution_id"], name: "index_instution_addresses_on_institution_id"
  end

  create_table "modalities", force: :cascade do |t|
    t.string "code", limit: 16, null: false
    t.string "name", limit: 255, null: false
    t.text "description"
    t.bigint "status_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["code"], name: "uidx_modalities_code", unique: true
    t.index ["status_id"], name: "index_modalities_on_status_id"
  end

  create_table "municipalities", force: :cascade do |t|
    t.bigint "state_id", null: false
    t.string "name", limit: 255, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["state_id", "name"], name: "uidx_municipalities_state_name", unique: true
    t.index ["state_id"], name: "index_municipalities_on_state_id"
  end

  create_table "parents", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_parents_on_user_id"
    t.index ["user_id"], name: "uidx_parents_user", unique: true
  end

  create_table "professor_courses", force: :cascade do |t|
    t.bigint "professor_id", null: false
    t.bigint "course_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["course_id"], name: "index_professor_courses_on_course_id"
    t.index ["professor_id", "course_id"], name: "uidx_professor_courses", unique: true
    t.index ["professor_id"], name: "index_professor_courses_on_professor_id"
  end

  create_table "professors", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "enrollment", limit: 32, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_professors_on_user_id"
    t.index ["user_id"], name: "uidx_professors_user", unique: true
  end

  create_table "relationships", force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.bigint "status_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "uidx_relationships_name", unique: true
    t.index ["status_id"], name: "index_relationships_on_status_id"
  end

  create_table "settlements", force: :cascade do |t|
    t.bigint "municipality_id", null: false
    t.string "name", limit: 255, null: false
    t.string "zip_code", limit: 16, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["municipality_id", "name", "zip_code"], name: "uidx_settlements", unique: true
    t.index ["municipality_id"], name: "index_settlements_on_municipality_id"
    t.index ["zip_code"], name: "idx_settlement_zip_codes"
  end

  create_table "states", force: :cascade do |t|
    t.bigint "country_id", null: false
    t.string "name", limit: 255, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["country_id", "name"], name: "uidx_states_country_name", unique: true
    t.index ["country_id"], name: "index_states_on_country_id"
  end

  create_table "statuses", force: :cascade do |t|
    t.string "code", limit: 16, null: false
    t.string "name", limit: 255, null: false
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["code"], name: "uidx_statuses_code", unique: true
  end

  create_table "student_courses", force: :cascade do |t|
    t.bigint "student_id", null: false
    t.bigint "course_evaluation_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["course_evaluation_id"], name: "index_student_courses_on_course_evaluation_id"
    t.index ["student_id", "course_evaluation_id"], name: "uidx_student_courses", unique: true
    t.index ["student_id"], name: "index_student_courses_on_student_id"
  end

  create_table "student_homeworks", force: :cascade do |t|
    t.bigint "student_id", null: false
    t.bigint "course_homework_id", null: false
    t.text "observations"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["course_homework_id", "student_id"], name: "uidx_student_homeworks", unique: true
    t.index ["course_homework_id"], name: "index_student_homeworks_on_course_homework_id"
    t.index ["student_id"], name: "index_student_homeworks_on_student_id"
  end

  create_table "students", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "enrollment", limit: 32, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["enrollment"], name: "uidx_students_enrollment", unique: true
    t.index ["user_id"], name: "index_students_on_user_id"
    t.index ["user_id"], name: "uidx_students_user", unique: true
  end

  create_table "syllabus_grades", force: :cascade do |t|
    t.bigint "career_syllabus_id", null: false
    t.bigint "grade_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["career_syllabus_id", "grade_id"], name: "uidx_syllabus_grades", unique: true
    t.index ["career_syllabus_id"], name: "index_syllabus_grades_on_career_syllabus_id"
    t.index ["grade_id"], name: "index_syllabus_grades_on_grade_id"
  end

  create_table "syllabuses", force: :cascade do |t|
    t.string "code", limit: 16, null: false
    t.string "name", limit: 255, null: false
    t.text "description"
    t.integer "approval_credits", limit: 2, default: 0, null: false
    t.bigint "status_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["code"], name: "uidx_syllabuses_code", unique: true
    t.index ["status_id"], name: "index_syllabuses_on_status_id"
  end

  create_table "turn_evaluations", force: :cascade do |t|
    t.bigint "cycle_turn_id", null: false
    t.bigint "evaluation_period_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cycle_turn_id", "evaluation_period_id"], name: "uidx_turn_evaluations", unique: true
    t.index ["cycle_turn_id"], name: "index_turn_evaluations_on_cycle_turn_id"
    t.index ["evaluation_period_id"], name: "index_turn_evaluations_on_evaluation_period_id"
  end

  create_table "turns", force: :cascade do |t|
    t.string "code", limit: 16, null: false
    t.string "name", limit: 255, null: false
    t.text "description"
    t.time "start", null: false
    t.time "finish", null: false
    t.bigint "status_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["code"], name: "uidx_turns_code", unique: true
    t.index ["status_id"], name: "index_turns_on_status_id"
  end

  create_table "tutors", force: :cascade do |t|
    t.bigint "student_id", null: false
    t.bigint "parent_id", null: false
    t.bigint "relationship_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["parent_id"], name: "index_tutors_on_parent_id"
    t.index ["relationship_id"], name: "index_tutors_on_relationship_id"
    t.index ["student_id", "parent_id"], name: "uidx_tutors", unique: true
    t.index ["student_id"], name: "index_tutors_on_student_id"
  end

  create_table "user_addresses", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "address_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["address_id"], name: "index_user_addresses_on_address_id"
    t.index ["user_id", "address_id"], name: "uidx_user_address", unique: true
    t.index ["user_id"], name: "index_user_addresses_on_user_id"
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
    t.index ["second_last_name"], name: "index_users_on_second_last_name"
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  add_foreign_key "academic_cycles", "cycle_types"
  add_foreign_key "academic_cycles", "statuses"
  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "addresses", "settlements"
  add_foreign_key "attendance_types", "statuses"
  add_foreign_key "buildings", "campuses"
  add_foreign_key "buildings", "statuses"
  add_foreign_key "campus_addresses", "addresses"
  add_foreign_key "campus_addresses", "campuses"
  add_foreign_key "campus_evaluations", "campuses"
  add_foreign_key "campus_evaluations", "turn_evaluations"
  add_foreign_key "campuses", "institutions"
  add_foreign_key "campuses", "statuses"
  add_foreign_key "career_syllabuses", "careers"
  add_foreign_key "career_syllabuses", "syllabuses"
  add_foreign_key "careers", "educative_levels"
  add_foreign_key "careers", "statuses"
  add_foreign_key "classrooms", "buildings"
  add_foreign_key "classrooms", "statuses"
  add_foreign_key "course_evaluations", "campus_evaluations"
  add_foreign_key "course_evaluations", "grade_courses"
  add_foreign_key "course_evaluations", "groups"
  add_foreign_key "course_evaluations", "professors"
  add_foreign_key "course_homeworks", "course_evaluations"
  add_foreign_key "course_marks", "student_courses"
  add_foreign_key "courses", "statuses"
  add_foreign_key "cycle_modalities", "academic_cycles"
  add_foreign_key "cycle_modalities", "modalities"
  add_foreign_key "cycle_turns", "cycle_modalities"
  add_foreign_key "cycle_turns", "turns"
  add_foreign_key "cycle_types", "statuses"
  add_foreign_key "educative_levels", "statuses"
  add_foreign_key "evaluation_attendances", "attendance_types"
  add_foreign_key "evaluation_attendances", "student_courses"
  add_foreign_key "evaluation_periods", "statuses"
  add_foreign_key "grade_courses", "courses"
  add_foreign_key "grade_courses", "syllabus_grades"
  add_foreign_key "grades", "statuses"
  add_foreign_key "groups", "statuses"
  add_foreign_key "homework_marks", "student_homeworks"
  add_foreign_key "institutions", "statuses"
  add_foreign_key "instution_addresses", "addresses"
  add_foreign_key "instution_addresses", "institutions"
  add_foreign_key "modalities", "statuses"
  add_foreign_key "municipalities", "states"
  add_foreign_key "parents", "users"
  add_foreign_key "professor_courses", "courses"
  add_foreign_key "professor_courses", "professors"
  add_foreign_key "professors", "users"
  add_foreign_key "relationships", "statuses"
  add_foreign_key "settlements", "municipalities"
  add_foreign_key "states", "countries"
  add_foreign_key "student_courses", "course_evaluations"
  add_foreign_key "student_courses", "students"
  add_foreign_key "student_homeworks", "course_homeworks"
  add_foreign_key "student_homeworks", "students"
  add_foreign_key "students", "users"
  add_foreign_key "syllabus_grades", "career_syllabuses"
  add_foreign_key "syllabus_grades", "grades"
  add_foreign_key "syllabuses", "statuses"
  add_foreign_key "turn_evaluations", "cycle_turns"
  add_foreign_key "turn_evaluations", "evaluation_periods"
  add_foreign_key "turns", "statuses"
  add_foreign_key "tutors", "parents"
  add_foreign_key "tutors", "relationships"
  add_foreign_key "tutors", "students"
  add_foreign_key "user_addresses", "addresses"
  add_foreign_key "user_addresses", "users"
end
