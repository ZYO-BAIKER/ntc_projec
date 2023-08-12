class CreateLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :locations do |t|
      t.string  :place, comment: "工事場所"
      t.string  :location_user, comment: "使用者"
      t.string  :location_other_user, comment: "その他の使用者"
      t.integer :usage_count, comment: "使用数"
      t.date    :period_start, comment: "使用開始時"
      t.date    :period_end, comment: "使用終了時"
      t.references :material, null: false, foreign_key: true, comment: "資産"
      t.timestamps
    end
  end
end
