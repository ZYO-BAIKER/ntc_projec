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

ActiveRecord::Schema.define(version: 2022_01_16_145958) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "materials", force: :cascade do |t|
    t.string "material_name", null: false
    t.string "maker"
    t.integer "all_count", null: false
    t.integer "garage_count"
    t.integer "garage2_count"
    t.integer "garage3_count"
    t.string "place"
    t.string "user"
    t.string "other_users"
    t.integer "use_count"
    t.date "period_start"
    t.date "period_end"
    t.string "place2"
    t.string "user2"
    t.string "other_users2"
    t.integer "use_count2"
    t.date "period_start2"
    t.date "period_end2"
    t.string "place3"
    t.string "user3"
    t.string "other_users3"
    t.integer "use_count3"
    t.date "period_start3"
    t.date "period_end3"
    t.string "repair_request"
    t.integer "repair_count"
    t.date "purchase_date"
    t.integer "purchase_price"
    t.integer "purchase_place"
    t.date "inspection_date"
    t.string "inspection_content"
    t.text "memo"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "account", default: "", null: false
    t.integer "authority", default: 1, null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
