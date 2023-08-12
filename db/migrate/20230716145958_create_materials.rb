class CreateMaterials < ActiveRecord::Migration[6.0]
  def change
    create_table :materials do |t|
      t.string  :material_name, null: false, comment: "資産名"
      t.string  :maker,         null: false, comment: "メーカー"
      t.integer :all_count,     null: false, comment: "全数量"
      t.integer :company_count, null: false, comment: "社内数"
      t.text    :memo
      t.timestamps
    end
  end
end
