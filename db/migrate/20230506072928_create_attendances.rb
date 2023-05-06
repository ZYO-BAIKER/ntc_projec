class CreateAttendances < ActiveRecord::Migration[6.0]
  def change
    create_table :attendances do |t|
      t.string     :client,             null: false  # 依頼主(必須)
      t.string     :construction_site,  null: false  # 工事場所(必須)
      t.time       :departure_time                   # 出発時間
      t.time       :arrival_time                     # 到着時間
      t.string     :remark                           # 備考欄
      t.string     :vehicle                          # 使用車両
      t.timestamps
    end
  end
end
