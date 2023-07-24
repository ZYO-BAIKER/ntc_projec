class Purchase < ApplicationRecord
  belongs_to :material

  validates :purchase_date, :purchase_price, presence: true
  validates :purchase_price, numericality: { only_integer: true, greater_than_or_equal_to: 0, message: "は半角で入力して下さい" }
end
