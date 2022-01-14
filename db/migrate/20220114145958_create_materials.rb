class CreateMaterials < ActiveRecord::Migration[6.0]
  def change
    create_table :materials do |t|
      t.string  :name,    null: false  # 資産名(必須)
      t.string  :maker                 # メーカー
      t.string  :place,   null: false  # 場所(必須)
      t.string  :user,    null: false  # 使用者(必須)
      t.string  :period,  null: false  # 使用期間(必須)
      t.date    :purchase_date         # 購入日
      t.integer :price                 # 購入金額
      t.date    :inspection_date       # 修理点検日
      t.text    :memo,    null: false  # メモ(必須)
      t.timestamps
    end
  end
end
