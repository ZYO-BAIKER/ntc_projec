class CreateMaterials < ActiveRecord::Migration[6.0]
  def change
    create_table :materials do |t|
      t.string  :material_name,  null: false  # 資産名(必須)
      t.string  :maker                        # メーカー
      t.integer :all_count,      null: false  # 全数量(必須)
      t.integer :garage_count                 # 車庫数量
      t.integer :garage2_count                # 第二倉庫数量
      t.integer :garage3_count                # 舞台工場数量
      t.string  :place                        # 現場①
      t.string  :user                         # 使用者①
      t.string  :other_users                  # その他使用者①
      t.integer :use_count                    # 使用数①
      t.date    :period_start                 # 使用開始①
      t.date    :period_end                   # 使用終了①
      t.string  :place2                       # 現場②
      t.string  :user2                        # 使用者②
      t.string  :other_users2                 # その他使用者②
      t.integer :use_count2                   # 使用数②
      t.date    :period_start2                # 使用開始②
      t.date    :period_end2                  # 使用終了②
      t.string  :place3                       # 現場③
      t.string  :user3                        # 使用者③
      t.string  :other_users3                 # その他使用者③
      t.integer :use_count3                   # 使用数③
      t.date    :period_start3                # 使用開始③
      t.date    :period_end3                  # 使用終了③
      t.string  :repair_request               # 修理依頼先
      t.integer :repair_count                 # 修理数
      t.date    :purchase_date                # 購入日
      t.integer :purchase_price               # 購入金額
      t.integer :purchase_place               # 購入場所
      t.date    :inspection_date              # 修理点検日
      t.string  :inspection_content           # 修理点検内容
      t.text    :memo                         # メモ
      t.timestamps
    end
  end
end
