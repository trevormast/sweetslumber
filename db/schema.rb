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

ActiveRecord::Schema.define(version: 20170104041431) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "locations", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questionaires", force: :cascade do |t|
    t.text     "baby_name"
    t.datetime "baby_dob"
    t.string   "nap_location"
    t.string   "night_location"
    t.string   "desired_sleep_location"
    t.string   "nap_routine"
    t.string   "night_routine"
    t.integer  "naps_per_day"
    t.time     "bedtime"
    t.string   "sleep_obstacle"
    t.integer  "nightwakings"
    t.string   "sleep_goal"
    t.string   "referred_by"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "registration_id"
  end

  add_index "questionaires", ["registration_id"], name: "index_questionaires_on_registration_id", using: :btree

  create_table "registrations", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "workshop_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "charge_token"
    t.boolean  "plus_one"
  end

  add_index "registrations", ["user_id"], name: "index_registrations_on_user_id", using: :btree
  add_index "registrations", ["workshop_id"], name: "index_registrations_on_workshop_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "workshop_id"
    t.string   "name"
    t.boolean  "admin",                  default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["workshop_id"], name: "index_users_on_workshop_id", using: :btree

  create_table "workshops", force: :cascade do |t|
    t.string   "subject"
    t.datetime "time"
    t.integer  "limit"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "location_id"
    t.integer  "price"
    t.integer  "plus_one_price"
  end

  add_index "workshops", ["location_id"], name: "index_workshops_on_location_id", using: :btree

  add_foreign_key "questionaires", "registrations"
  add_foreign_key "registrations", "users"
  add_foreign_key "registrations", "workshops"
  add_foreign_key "users", "workshops"
  add_foreign_key "workshops", "locations"
end
