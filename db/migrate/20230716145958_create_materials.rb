class CreateMaterials < ActiveRecord::Migration[6.0]
  def change
    create_table :materials do |t|
      t.string  :material_name,  null: false  # 資産名(必須)
      t.string  :maker                        # メーカー
      t.integer :all_count,      null: false  # 全数量(必須)
      t.integer :company_count                # 会社数量
      t.text    :memo                         # メモ
      t.timestamps
    end
  end
end
