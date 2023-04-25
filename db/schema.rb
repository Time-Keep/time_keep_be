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

ActiveRecord::Schema.define(version: 2023_04_25_213802) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "counties", force: :cascade do |t|
    t.string "county"
    t.string "county_ascii"
    t.string "county_full"
    t.string "county_fips"
    t.string "state_id"
    t.string "state_name"
    t.string "lat"
    t.string "lng"
    t.string "population"
    t.string "county_unemployment_rate"
    t.string "state_unemployment"
    t.string "county_median_income"
    t.string "tax_rate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
