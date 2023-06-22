class CreateVehicles < ActiveRecord::Migration[6.0]
  def change
    create_table :vehicles do |t|
      t.string  :number,       null: false
      t.integer :vehicle_type, null: false
      t.timestamps
    end
  end
end
