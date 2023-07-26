FactoryBot.define do
  factory :location do
    material
    place { Faker::Address.city }
    user { UserSelect.data.sample[:name] }
    use_count { Faker::Number.between(from: 1, to: 10) }
  end
end
