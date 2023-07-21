class CreateAttendances < ActiveRecord::Migration[6.0]
  def change
    create_table :attendances do |t|
      t.date       :date,               null: false
      t.string     :client,             null: false
      t.string     :construction_site,  null: false
      t.string     :work_content,       null: false
      t.time       :departure_time
      t.time       :arrival_time
      t.integer    :worker_count
      t.string     :remark
      t.timestamps
    end
  end
end
