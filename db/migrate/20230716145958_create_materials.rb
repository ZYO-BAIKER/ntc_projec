class CreateMaterials < ActiveRecord::Migration[6.0]
  def change
    create_table :materials do |t|
      t.string  :material_name, null: false
      t.string  :maker,         null: false
      t.integer :all_count,     null: false
      t.integer :company_count, null: false
      t.text    :memo
      t.timestamps
    end
  end
end
