class Repair < ApplicationRecord
  belongs_to :material

  validates :repair_count, numericality: { only_integer: true, greater_than_or_equal_to: 0, message: "は半角で入力して下さい" }, allow_blank: true
end
