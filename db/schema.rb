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

ActiveRecord::Schema.define(version: 2023_05_12_040954) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "counties", force: :cascade do |t|
    t.string "name"
    t.string "county_full"
    t.string "fips"
    t.string "lat"
    t.string "lon"
    t.string "population"
    t.string "unemployment_rate"
    t.string "median_income"
    t.string "tax_rate"
    t.integer "establishment_count", default: 0
    t.integer "annual_wages", default: 0
    t.bigint "state_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["state_id"], name: "index_counties_on_state_id"
  end

  create_table "states", force: :cascade do |t|
    t.string "name"
    t.string "abbrev"
    t.string "unemp_rate", default: "0"
    t.string "tax_rate", default: "0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "counties", "states"
end
