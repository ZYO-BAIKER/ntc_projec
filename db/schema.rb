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

ActiveRecord::Schema.define(version: 2023_07_24_024459) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attendance_vehicles", force: :cascade do |t|
    t.bigint "attendance_id", null: false, comment: "記録"
    t.bigint "vehicle_id", null: false, comment: "車両"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["attendance_id"], name: "index_attendance_vehicles_on_attendance_id"
    t.index ["vehicle_id"], name: "index_attendance_vehicles_on_vehicle_id"
  end

  create_table "attendance_workers", force: :cascade do |t|
    t.bigint "attendance_id", null: false, comment: "記録"
    t.bigint "worker_id", null: false, comment: "作業員"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["attendance_id"], name: "index_attendance_workers_on_attendance_id"
    t.index ["worker_id"], name: "index_attendance_workers_on_worker_id"
  end

  create_table "attendances", force: :cascade do |t|
    t.date "date", null: false, comment: "日付"
    t.string "client", null: false, comment: "依頼主"
    t.string "construction_site", null: false, comment: "工事場所"
    t.string "work_content", null: false, comment: "作業内容"
    t.time "departure_time", comment: "出発時間"
    t.time "arrival_time", comment: "到着時間"
    t.integer "worker_count", comment: "作業員数"
    t.string "remark", comment: "備考"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string "place", comment: "工事場所"
    t.string "location_user", comment: "使用者"
    t.string "location_other_user", comment: "その他の使用者"
    t.integer "usage_count", comment: "使用数"
    t.date "period_start", comment: "使用開始時"
    t.date "period_end", comment: "使用終了時"
    t.bigint "material_id", null: false, comment: "資産"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["material_id"], name: "index_locations_on_material_id"
  end

  create_table "materials", force: :cascade do |t|
    t.string "material_name", null: false, comment: "資産名"
    t.string "maker", null: false, comment: "メーカー"
    t.integer "all_count", null: false, comment: "全数量"
    t.integer "company_count", null: false, comment: "社内数"
    t.text "memo"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "purchases", force: :cascade do |t|
    t.date "purchase_date", comment: "購入日"
    t.integer "purchase_price", comment: "購入金額"
    t.string "purchase_place", comment: "購入場所"
    t.bigint "material_id", null: false, comment: "資産"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["material_id"], name: "index_purchases_on_material_id"
  end

  create_table "repairs", force: :cascade do |t|
    t.string "repair_request", comment: "修理依頼先"
    t.integer "repair_count", comment: "修理数"
    t.date "inspection_date", comment: "修理点検日"
    t.string "inspection_content", comment: "修理点検内容"
    t.bigint "material_id", null: false, comment: "資産"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["material_id"], name: "index_repairs_on_material_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "account", default: "", null: false
    t.integer "authority", default: 1, null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "vehicles", force: :cascade do |t|
    t.string "number", null: false, comment: "車両番号"
    t.integer "vehicle_type", null: false, comment: "車種"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "workers", force: :cascade do |t|
    t.string "name", null: false, comment: "作業員"
    t.integer "group", null: false, comment: "所属会社"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "attendance_vehicles", "attendances"
  add_foreign_key "attendance_vehicles", "vehicles"
  add_foreign_key "attendance_workers", "attendances"
  add_foreign_key "attendance_workers", "workers"
  add_foreign_key "locations", "materials"
  add_foreign_key "purchases", "materials"
  add_foreign_key "repairs", "materials"
end
