class Attendance < ApplicationRecord
  has_and_belongs_to_many :workers, join_table: "attendance_workers"

  validates :date, :client, :construction_site, :work_content, presence: true
end