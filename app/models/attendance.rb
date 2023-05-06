class Attendance < ApplicationRecord
  has_and_belongs_to_many :workers

  validates :client, :construction_site, presence: true
end
