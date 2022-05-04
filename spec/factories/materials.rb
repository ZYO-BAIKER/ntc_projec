FactoryBot.define do
  factory :material do
    material_name  { Faker::Lorem.word }
    maker          { Faker::Name.initials }
    all_count      { 5 }
    company_count  { 5 }
    place { Faker::Address.state }
    user { Faker::Name.name }
    period_start { Faker::Date.between(from: 5.days.ago, to: Time.zone.today).strftime("%Y-%m-%d") }
    period_end   { Faker::Date.between(from: 5.days.ago, to: Time.zone.today).strftime("%Y-%m-%d") }
    repair_request { Faker::Name.initials }
    repair_count   { 0 }
    memo { Faker::Lorem.sentence }
  end
end
