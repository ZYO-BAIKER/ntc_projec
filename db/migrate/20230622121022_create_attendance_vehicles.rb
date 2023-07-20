class CreateAttendanceVehicles < ActiveRecord::Migration[6.0]
  def change
    create_table :attendance_vehicles do |t|
      t.references :attendance, null: false, foreign_key: true
      t.references :vehicle,    null: false, foreign_key: true
      t.timestamps
    end
  end
end
