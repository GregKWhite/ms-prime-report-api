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

ActiveRecord::Schema.define(version: 20161028213429) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "driver_reports", force: :cascade do |t|
    t.integer  "driver_id"
    t.integer  "location_id"
    t.integer  "helper_id"
    t.decimal  "gallons",     default: "0.0", null: false
    t.decimal  "amount_paid", default: "0.0", null: false
    t.decimal  "mileage",     default: "0.0", null: false
    t.text     "notes",       default: "",    null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "truck_id"
    t.index ["driver_id"], name: "index_driver_reports_on_driver_id", using: :btree
    t.index ["helper_id"], name: "index_driver_reports_on_helper_id", using: :btree
    t.index ["location_id"], name: "index_driver_reports_on_location_id", using: :btree
  end

  create_table "drivers", force: :cascade do |t|
    t.string   "name",            default: "", null: false
    t.string   "password_digest", default: "", null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string   "name",       default: "", null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "truck_logs", force: :cascade do |t|
    t.integer "truck_id"
    t.decimal "price"
    t.decimal "mileage"
    t.text    "description"
    t.date    "performed_on"
    t.index ["truck_id"], name: "index_truck_logs_on_truck_id", using: :btree
  end

  create_table "trucks", force: :cascade do |t|
    t.string   "identifier", default: "",    null: false
    t.decimal  "mileage",    default: "0.0", null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "weekly_reports", force: :cascade do |t|
    t.integer  "truck_id"
    t.decimal  "initial_mileage", default: "0.0", null: false
    t.decimal  "current_mileage", default: "0.0", null: false
    t.decimal  "total_gas",       default: "0.0", null: false
    t.decimal  "total_paid",      default: "0.0", null: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.index ["truck_id"], name: "index_weekly_reports_on_truck_id", using: :btree
  end

end
