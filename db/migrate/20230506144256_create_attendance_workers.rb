class CreateAttendanceWorkers < ActiveRecord::Migration[6.0]
  def change
    create_table :attendance_workers do |t|
      t.references :attendance, null: false, foreign_key: true
      t.references :worker,     null: false, foreign_key: true
      t.timestamps
    end
  end
end
