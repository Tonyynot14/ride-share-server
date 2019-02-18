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

ActiveRecord::Schema.define(version: 2019_02_18_162831) do

  create_table "drivers", force: :cascade do |t|
    t.integer "organization_id"
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.string "email"
    t.string "car_make"
    t.string "car_model"
    t.string "car_color"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_drivers_on_organization_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name"
    t.string "street"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "riders", force: :cascade do |t|
    t.integer "organization_id"
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.string "email"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_riders_on_organization_id"
  end

  create_table "rides", force: :cascade do |t|
    t.integer "organization_id"
    t.integer "rider_id"
    t.integer "driver_id"
    t.datetime "pick_up_time"
    t.string "start_street"
    t.string "start_city"
    t.string "start_state"
    t.string "start_zip"
    t.string "end_street"
    t.string "end_city"
    t.string "end_state"
    t.string "end_zip"
    t.text "reason"
    t.string "status", default: "requested"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["driver_id"], name: "index_rides_on_driver_id"
    t.index ["organization_id"], name: "index_rides_on_organization_id"
    t.index ["rider_id"], name: "index_rides_on_rider_id"
  end

  create_table "tokens", force: :cascade do |t|
    t.integer "rider_id"
    t.datetime "created_at", null: false
    t.datetime "expires_at"
    t.datetime "used_at"
    t.boolean "is_valid"
    t.datetime "updated_at", null: false
    t.index ["rider_id"], name: "index_tokens_on_rider_id"
  end

end
