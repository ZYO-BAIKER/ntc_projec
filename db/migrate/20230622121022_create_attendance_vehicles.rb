class CreateAttendanceVehicles < ActiveRecord::Migration[6.0]
  def change
    create_table :attendance_vehicles do |t|
      t.references :attendance, null: false, foreign_key: true, comment: "記録"
      t.references :vehicle,    null: false, foreign_key: true, comment: "車両"
      t.timestamps
    end
  end
end
