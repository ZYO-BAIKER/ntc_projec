class CreateLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :locations do |t|
      t.string  :place        # 現場
      t.string  :user         # 使用者
      t.string  :other_users  # その他使用者
      t.integer :use_count    # 使用数
      t.date    :period_start # 使用開始
      t.date    :period_end   # 使用終了
      t.references :material, null: false, foreign_key: true
      t.timestamps
    end
  end
end
