class Worker < ApplicationRecord
  has_and_belongs_to_many :attendances

  validates :name, :group, presence: true
end
