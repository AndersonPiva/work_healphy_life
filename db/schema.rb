# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20151227041728) do

  create_table "addresses", force: :cascade do |t|
    t.string   "city",       limit: 255
    t.string   "state",      limit: 255
    t.string   "district",   limit: 255
    t.string   "street",     limit: 255
    t.string   "cep",        limit: 255
    t.string   "number",     limit: 255
    t.string   "reference",  limit: 255
    t.integer  "clinic_id",  limit: 4
    t.integer  "patient_id", limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "addresses", ["clinic_id"], name: "index_addresses_on_clinic_id", using: :btree
  add_index "addresses", ["patient_id"], name: "index_addresses_on_patient_id", using: :btree

  create_table "appointments", force: :cascade do |t|
    t.date     "dateAppointment"
    t.time     "schedule"
    t.float    "price",           limit: 24
    t.string   "description",     limit: 255
    t.integer  "user_id",         limit: 4
    t.integer  "clinic_id",       limit: 4
    t.integer  "patient_id",      limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "appointments", ["clinic_id"], name: "index_appointments_on_clinic_id", using: :btree
  add_index "appointments", ["patient_id"], name: "index_appointments_on_patient_id", using: :btree
  add_index "appointments", ["user_id"], name: "index_appointments_on_user_id", using: :btree

  create_table "clinics", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "telephone1", limit: 255
    t.string   "telephone2", limit: 255
    t.string   "cpfCnpj",    limit: 255
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "clinics", ["user_id"], name: "index_clinics_on_user_id", using: :btree

  create_table "compromises", force: :cascade do |t|
    t.string   "title",       limit: 255
    t.date     "date"
    t.time     "schedule"
    t.string   "description", limit: 255
    t.integer  "user_id",     limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "compromises", ["user_id"], name: "index_compromises_on_user_id", using: :btree

  create_table "contacts", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "email",      limit: 255
    t.string   "subject",    limit: 255
    t.text     "message",    limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "diets", force: :cascade do |t|
    t.date     "dateStart"
    t.date     "dateEnd"
    t.integer  "duration",   limit: 4
    t.string   "kind",       limit: 255
    t.integer  "patient_id", limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "diets", ["patient_id"], name: "index_diets_on_patient_id", using: :btree

  create_table "exercises", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "description", limit: 255
    t.integer  "series",      limit: 4
    t.string   "repeats",     limit: 255
    t.time     "duration"
    t.integer  "training_id", limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "exercises", ["training_id"], name: "index_exercises_on_training_id", using: :btree

  create_table "meals", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.time     "time"
    t.float    "totalCalories", limit: 24
    t.string   "description",   limit: 255
    t.integer  "diet_id",       limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "meals", ["diet_id"], name: "index_meals_on_diet_id", using: :btree

  create_table "measurements", force: :cascade do |t|
    t.date     "date"
    t.string   "nameMeasure", limit: 255
    t.float    "size",        limit: 24
    t.integer  "patient_id",  limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "measurements", ["patient_id"], name: "index_measurements_on_patient_id", using: :btree

  create_table "patients", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.date     "birthdate"
    t.string   "genre",        limit: 255
    t.string   "cpf",          limit: 255
    t.float    "weigth",       limit: 24
    t.float    "heigth",       limit: 24
    t.float    "bf",           limit: 24
    t.string   "objective",    limit: 255
    t.string   "observations", limit: 255
    t.string   "telephone",    limit: 255
    t.string   "email",        limit: 255
    t.string   "login",        limit: 255
    t.string   "password",     limit: 255
    t.integer  "clinic_id",    limit: 4
    t.integer  "user_id",      limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "patients", ["clinic_id"], name: "index_patients_on_clinic_id", using: :btree
  add_index "patients", ["user_id"], name: "index_patients_on_user_id", using: :btree

  create_table "ratings", force: :cascade do |t|
    t.date     "date"
    t.float    "handleDiameter", limit: 24
    t.float    "kneeDiameter",   limit: 24
    t.float    "leg",            limit: 24
    t.float    "belly",          limit: 24
    t.float    "chest",          limit: 24
    t.integer  "patient_id",     limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "ratings", ["patient_id"], name: "index_ratings_on_patient_id", using: :btree

  create_table "realizations", force: :cascade do |t|
    t.date     "date"
    t.string   "status",      limit: 255
    t.string   "observation", limit: 255
    t.integer  "training_id", limit: 4
    t.integer  "patient_id",  limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "realizations", ["patient_id"], name: "index_realizations_on_patient_id", using: :btree
  add_index "realizations", ["training_id"], name: "index_realizations_on_training_id", using: :btree

  create_table "trainings", force: :cascade do |t|
    t.string   "weekDay",        limit: 255
    t.string   "muscularGroups", limit: 255
    t.string   "description",    limit: 255
    t.date     "dateStart"
    t.date     "dateEnd"
    t.time     "duration"
    t.integer  "patient_id",     limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "trainings", ["patient_id"], name: "index_trainings_on_patient_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name",                   limit: 255, default: "",   null: false
    t.string   "telephone1",             limit: 255
    t.string   "telephone2",             limit: 255
    t.string   "cpf",                    limit: 255
    t.string   "email",                  limit: 255, default: "",   null: false
    t.string   "encrypted_password",     limit: 255, default: "",   null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: 255
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.string   "cover_file_name",        limit: 255
    t.string   "cover_content_type",     limit: 255
    t.integer  "cover_file_size",        limit: 4
    t.datetime "cover_updated_at"
    t.boolean  "admin",                              default: true
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "weighings", force: :cascade do |t|
    t.date     "dateWeighing"
    t.float    "weight",       limit: 24
    t.integer  "patient_id",   limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "weighings", ["patient_id"], name: "index_weighings_on_patient_id", using: :btree

  add_foreign_key "addresses", "clinics"
  add_foreign_key "addresses", "patients"
  add_foreign_key "appointments", "clinics"
  add_foreign_key "appointments", "patients"
  add_foreign_key "appointments", "users"
  add_foreign_key "clinics", "users"
  add_foreign_key "compromises", "users"
  add_foreign_key "diets", "patients"
  add_foreign_key "exercises", "trainings"
  add_foreign_key "meals", "diets"
  add_foreign_key "measurements", "patients"
  add_foreign_key "patients", "clinics"
  add_foreign_key "patients", "users"
  add_foreign_key "ratings", "patients"
  add_foreign_key "realizations", "patients"
  add_foreign_key "realizations", "trainings"
  add_foreign_key "trainings", "patients"
  add_foreign_key "weighings", "patients"
end
