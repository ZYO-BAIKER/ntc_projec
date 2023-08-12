class CreateVehicles < ActiveRecord::Migration[6.0]
  def change
    create_table :vehicles do |t|
      t.string  :number,       null: false, comment: "車両番号"
      t.integer :vehicle_type, null: false, comment: "車種"
      t.timestamps
    end
  end
end
