class CreateAttendanceWorkers < ActiveRecord::Migration[6.0]
  def change
    create_table :attendance_workers do |t|
      t.references :attendance, null: false, foreign_key: true, comment: "記録"
      t.references :worker,     null: false, foreign_key: true, comment: "作業員"
      t.timestamps
    end
  end
end
