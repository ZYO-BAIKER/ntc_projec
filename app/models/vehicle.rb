class Vehicle < ApplicationRecord
  has_and_belongs_to_many :attendances, join_table: "attendance_vehicles"

  validates :number, :vehicle_type, presence: true
  enum vehicle_type: { small_car: 0, four_ton_unic: 1, ten_ton_unic: 2, ten_ton_flat: 3, ten_ton_rafter: 4, light_van: 5 }
end
