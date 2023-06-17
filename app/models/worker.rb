class Worker < ApplicationRecord
  has_and_belongs_to_many :attendances, join_table: "attendance_workers"

  validates :name, :group, presence: true
  enum group: { ntc: 0, jsc: 1, yamagata: 2, part_time: 3, seiwah: 4 }
end
