WORKERS_DATA = [
  { name: "吉久保", group: 0 },
  { name: "椛沢", group: 0 },
  { name: "片根", group: 0 },
  { name: "平山", group: 0 },
  { name: "小沢", group: 0 },
  { name: "加藤", group: 0 },
  { name: "笹沼", group: 0 },
  { name: "小川", group: 0 },
  { name: "宮下", group: 0 },
  { name: "小沢", group: 0 },
  { name: "大越", group: 0 },
  { name: "山品", group: 0 },
  { name: "徳永", group: 0 },
  { name: "岡田", group: 0 },
  { name: "金田", group: 1 },
  { name: "樫村", group: 1 },
  { name: "杉本", group: 1 },
  { name: "直井", group: 1 },
  { name: "小野崎", group: 1 },
  { name: "芳賀", group: 1 },
  { name: "山口", group: 1 },
  { name: "三浦(JSC)", group: 1 },
  { name: "佐川", group: 1 },
  { name: "中島", group: 1 },
  { name: "山形", group: 2 },
  { name: "菊池", group: 2 },
  { name: "鈴木（山形）", group: 2 },
  { name: "稲田", group: 3 },
  { name: "渡辺", group: 3 },
  { name: "木内", group: 3 },
  { name: "田崎", group: 3 },
  { name: "渋谷", group: 3 },
  { name: "渡邉", group: 3 },
  { name: "佐渡", group: 3 },
  { name: "村上", group: 3 },
  { name: "諏訪", group: 3 },
  { name: "根本", group: 3 },
  { name: "三浦(聖和)", group: 3 },
  { name: "鈴木(聖和)", group: 3 },
  { name: "大友", group: 4 },
  { name: "椎名", group: 4 },
  { name: "宇佐美", group: 4 },
].freeze

VEHICLE_DATA = [
  { number: "...8", vehicle_type: 0 },
  { number: "88-78", vehicle_type: 0 },
  { number: "81-18", vehicle_type: 0 },
  { number: "80-08", vehicle_type: 0 },
  { number: "23-47", vehicle_type: 0 },
  { number: "86-78", vehicle_type: 0 },
  { number: "50-00", vehicle_type: 0 },
  { number: "51-51", vehicle_type: 0 },
  { number: "80-73", vehicle_type: 1 },
  { number: "47-56", vehicle_type: 1 },
  { number: "85-58", vehicle_type: 1 },
  { number: "30-96", vehicle_type: 1 },
  { number: "85-68", vehicle_type: 1 },
  { number: "88-23", vehicle_type: 1 },
  { number: "37-98", vehicle_type: 2 },
  { number: "81-88", vehicle_type: 2 },
  { number: "29-58", vehicle_type: 3 },
  { number: "88-52", vehicle_type: 4 },
  { number: "32-62", vehicle_type: 5 },
  { number: "52-10", vehicle_type: 5 },
  { number: "60-39", vehicle_type: 5 },
  { number: "80-00", vehicle_type: 5 },
  { number: "42-37", vehicle_type: 5 },
  { number: "85-10", vehicle_type: 5 },
  { number: "99", vehicle_type: 5 },
].freeze

MATERIAL_DATA = [
  { material_name: "オートレベル", maker: "Nikon", all_count: 2, company_count: 2, memo: "最終校正日:2016年" },
  { material_name: "オートレベル", maker: "シンワ", all_count: 1, company_count: 1, memo: "最終校正日:2019年" },
  { material_name: "レーザー", maker: "Tajima", all_count: 1, company_count: 1, memo: "" },
  { material_name: "レーザー", maker: "RYOBI", all_count: 1, company_count: 1, memo: "" },
  { material_name: "レーザー", maker: "HILTI", all_count: 1, company_count: 1, memo: "リース品 ※三脚は、購入品" },
  { material_name: "掃除機（100V）", maker: "日立,makita", all_count: 3, company_count: 3, memo: "日立✖️2
    makita✖️1" },
  { material_name: "掃除機（バッテリー）", maker: "日立", all_count: 2, company_count: 2, memo: "" },
  { material_name: "掃除機（バッテリー）", maker: "ヒルティ", all_count: 1, company_count: 1, memo: "リース品" },
  { material_name: "ハンマードリル六角軸（100V）", maker: "日立", all_count: 3, company_count: 3, memo: "" },
  { material_name: "ハンマードリル六角軸36V（バッテリー）", maker: "日立", all_count: 1, company_count: 1, memo: "" },
  { material_name: "ハンマードリル18V（バッテリー）", maker: "日立,HIKOKI", all_count: 5, company_count: 5, memo: "日立✖️3 HIKOKI✖️2" },
  { material_name: "ハンマードリル36V（バッテリー）", maker: "HILTI", all_count: 1, company_count: 1, memo: "" },
  { material_name: "ハンマードリル22V（バッテリー）", maker: "HILTI", all_count: 1, company_count: 1, memo: "" },
  { material_name: "ハンドリフト5.0t", maker: "Bishamon", all_count: 2, company_count: 2, memo: "" },
  { material_name: "ハンドリフト3.0t（幅広）", maker: "Bishamon", all_count: 1, company_count: 1, memo: "" },
  { material_name: "ハンドリフト2.5t（幅広）", maker: "Bishamon", all_count: 2, company_count: 2, memo: "" },
  { material_name: "ハンドリフト2.5t（幅狭）", maker: "Bishamon", all_count: 5, company_count: 4, memo: "" },
  { material_name: "アルミ台車（６輪）", maker: "なし", all_count: 2, company_count: 17, memo: "" },
  { material_name: "アルミ台車（４輪）", maker: "なし", all_count: 17, company_count: 17, memo: "" },
  { material_name: "10tローラー4輪", maker: "ダイキ", all_count: 1, company_count: 1, memo: "" },
  { material_name: "5tローラー", maker: "ダイキ", all_count: 1, company_count: 1, memo: "" },
  { material_name: "3tローラー", maker: "ダイキ", all_count: 1, company_count: 1, memo: "" },
  { material_name: "2tローラー", maker: "ダイキ", all_count: 1, company_count: 1, memo: "" },
  { material_name: "電チル", maker: "FUJISEI", all_count: 1, company_count: 1, memo: "" },
  { material_name: "押しジャッキ", maker: "EAGLE", all_count: 2, company_count: 2, memo: "" },
  { material_name: "2tチェーンブロック", maker: "KITO", all_count: 4, company_count: 4, memo: "" },
  { material_name: "1tレバーブロック", maker: "KITO", all_count: 4, company_count: 4, memo: "" },

].freeze

def create_workers
  WORKERS_DATA.each do |data|
    Worker.find_or_create_by!(data)
  end
end

def create_vehicles
  VEHICLE_DATA.each do |data|
    Vehicle.find_or_create_by!(data)
  end
end

def create_materials
  MATERIAL_DATA.each do |data|
    Material.find_or_create_by!(data)
  end
end

ActiveRecord::Base.transaction do
  create_workers
  create_vehicles
  create_materials
end
