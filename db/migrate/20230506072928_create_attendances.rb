class CreateAttendances < ActiveRecord::Migration[6.0]
  def change
    create_table :attendances do |t|
      t.date       :date,               null: false, comment: "日付"
      t.string     :client,             null: false, comment: "依頼主"
      t.string     :construction_site,  null: false, comment: "工事場所"
      t.string     :work_content,       null: false, comment: "作業内容"
      t.time       :departure_time, comment: "出発時間"
      t.time       :arrival_time, comment: "到着時間"
      t.integer    :worker_count, comment: "作業員数"
      t.string     :remark, comment: "備考"
      t.timestamps
    end
  end
end
