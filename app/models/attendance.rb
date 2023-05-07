class Attendance < ApplicationRecord
  has_and_belongs_to_many :workers

  validates :date, :client, :construction_site, presence: true
end
