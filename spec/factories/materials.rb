FactoryBot.define do
  factory :material do
    material_name { Faker::Lorem.word }
    maker { Faker::Company.name }
    all_count { Faker::Number.between(from: 1, to: 10) }
    company_count { Faker::Number.between(from: 0, to: 5) }
  end
end
