class Worker < ApplicationRecord
  has_and_belongs_to_many :attendances, join_table: "attendance_workers"

  validates :name, :group, presence: true
  enum group: { ntc: 0, jsc: 1, yamagata: 2, seiwah: 3, part_time: 4, other: 5 }
end
