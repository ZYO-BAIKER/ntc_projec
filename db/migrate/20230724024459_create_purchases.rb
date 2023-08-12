class CreatePurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :purchases do |t|
      t.date    :purchase_date, comment: "購入日"
      t.integer :purchase_price, comment: "購入金額"
      t.string  :purchase_place, comment: "購入場所"
      t.references :material, null: false, foreign_key: true, comment: "資産"
      t.timestamps
    end
  end
end
