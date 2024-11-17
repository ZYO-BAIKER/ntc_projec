FactoryBot.define do
  factory :attendance do
    date { Faker::Date.in_date_period }
    client { Faker::Company.name }
    construction_site { Faker::Address.street_address }
    work_content { Faker::Job.field }
    departure_time { Faker::Time.backward(days: 14, period: :morning) }
    arrival_time { Faker::Time.backward(days: 14, period: :evening) }
    remark { Faker::Lorem.sentence }
    vehicles { build_list(:vehicle, 3) }
    workers { build_list(:worker, 3) }
    trait :invalid do
      date { nil } # 例: dateをnilに設定
    end
  end
end
