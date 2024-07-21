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

ActiveRecord::Schema[7.0].define(version: 2024_07_21_124226) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "bookings", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.float "start_latitude", null: false
    t.float "start_longitude", null: false
    t.float "end_latitude", null: false
    t.float "end_longitude", null: false
    t.float "fare"
    t.string "status", null: false
    t.uuid "cab_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "user_id", null: false
    t.index ["cab_id"], name: "index_bookings_on_cab_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "cabs", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.float "longitude", null: false
    t.float "latitude", null: false
    t.string "cab_type", default: "regular", null: false
    t.boolean "is_available", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "user_id", null: false
    t.string "title", null: false
    t.index ["user_id"], name: "index_cabs_on_user_id"
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "bookings", "cabs"
  add_foreign_key "bookings", "users"
  add_foreign_key "cabs", "users"
end
