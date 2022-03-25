FactoryBot.define do
  factory :material do
    material_name { Faker::Lorem.word }
    material_count { Faker::Number.number }
    maker { Faker::Name.initials }
    place { Faker::Address.state }
    user { Faker::Name.name }
    period_start { Time.zone.now.strftime("%Y-%m-%d") }
    memo { Faker::Lorem.sentence }
  end
end
