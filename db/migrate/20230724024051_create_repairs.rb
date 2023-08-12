class CreateRepairs < ActiveRecord::Migration[6.0]
  def change
    create_table :repairs do |t|
      t.string  :repair_request, comment: "修理依頼先"
      t.integer :repair_count, comment: "修理数"
      t.date    :inspection_date, comment: "修理点検日"
      t.string  :inspection_content, comment: "修理点検内容"
      t.references :material, null: false, foreign_key: true, comment: "資産"
      t.timestamps
    end
  end
end
