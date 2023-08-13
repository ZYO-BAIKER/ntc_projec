class Attendance < ApplicationRecord
  has_and_belongs_to_many :workers, join_table: "attendance_workers"
  has_and_belongs_to_many :vehicles, join_table: "attendance_vehicles"

  validates :date, :client, :construction_site, :work_content, presence: true

  def empty_attributes?
    attributes.except("id", "created_at", "updated_at").all? {|_key, value| value.blank? }
  end
end
