class CreatePurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :purchases do |t|
      t.date    :purchase_date                # 購入日
      t.integer :purchase_price               # 購入金額
      t.string  :purchase_place               # 購入場所
      t.references :material, null: false, foreign_key: true
      t.timestamps
    end
  end
end
