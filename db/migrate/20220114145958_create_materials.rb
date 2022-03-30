class CreateMaterials < ActiveRecord::Migration[6.0]
  def change
    create_table :materials do |t|
      t.string  :material_name,  null: false  # 資産名(必須)
      t.integer :material_count, null: false  # 資産数(必須)
      t.string  :maker                        # メーカー
      t.string  :place,          null: false  # 場所1(必須)
      t.string  :other_places                 # 現場時の場所1
      t.string  :place_2                      # 場所2
      t.string  :other_places_2               # 現場時の場所2
      t.string  :place_3                      # 場所3
      t.string  :other_places_3               # 現場時の場所3
      t.string  :user                    # 使用者1(必須)
      t.string  :other_users             # その他使用者1
      t.string  :repair_request          # 修理依頼先1
      t.string  :user_2                  # 使用者2
      t.string  :other_users_2           # その他使用者2
      t.string  :repair_request_2        # 修理依頼先2
      t.string  :user_3                  # 使用者3
      t.string  :other_users_3           # その他使用者3
      t.string  :repair_request_3        # 修理依頼先3
      t.integer :use_count, null: false  # 使用数1(必須)
      t.integer :use_count_2             # 使用数2
      t.integer :use_count_3             # 使用数3
      t.date    :period_start            # 使用開始1
      t.date    :period_end              # 使用終了1
      t.date    :period_start_2          # 使用開始2
      t.date    :period_end_2            # 使用終了2
      t.date    :period_start_3          # 使用開始3
      t.date    :period_end_3            # 使用終了3
      t.date    :purchase_date           # 購入日
      t.integer :purchase_price          # 購入金額
      t.integer :purchase_place          # 購入場所
      t.date    :inspection_date         # 修理点検日
      t.string  :inspection_content      # 修理点検内容
      t.text    :memo                    # メモ
      t.timestamps
    end
  end
end
