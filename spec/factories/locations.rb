FactoryBot.define do
  factory :location do
    material
    place { Faker::Address.city }
    location_user { UserSelect.data.sample[:name] }
    usage_count { Faker::Number.between(from: 1, to: 10) }
  end
end
