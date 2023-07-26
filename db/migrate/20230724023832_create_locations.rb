class CreateLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :locations do |t|
      t.string  :place
      t.string  :location_user
      t.string  :location_other_user
      t.integer :usage_count
      t.date    :period_start
      t.date    :period_end
      t.references :material, null: false, foreign_key: true
      t.timestamps
    end
  end
end
