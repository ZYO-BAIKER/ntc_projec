FactoryBot.define do
  factory :vehicle do
    number { Faker::Vehicle.unique.vin }
    vehicle_type { Vehicle.vehicle_types.keys.sample }
  end
end
