FactoryBot.define do
  factory :material do
    material_name  { Faker::Lorem.word }
    maker          { Faker::Name.initials }
    all_count      { Faker::Number.number }
    garage_count   { Faker::Number.number }
    garage2_count  { Faker::Number.number }
    garage3_count  { Faker::Number.number }
    place { Faker::Address.state }
    user { Faker::Name.name }
    period_start { Faker::Date.between(from: 5.days.ago, to: Time.zone.today).strftime("%Y-%m-%d") }
    period_end   { Faker::Date.between(from: 5.days.ago, to: Time.zone.today).strftime("%Y-%m-%d") }
    repair_request { Faker::Name.initials }
    repair_count   { Faker::Number.number }
    memo { Faker::Lorem.sentence }
  end
end
