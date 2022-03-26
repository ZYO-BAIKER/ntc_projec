FactoryBot.define do
  factory :user do
    account { Faker::Lorem.characters(number: Random.new.rand(1..30)) }
    password { Faker::Internet.password(min_length: 8, max_length: 32, mix_case: true, special_characters: true) }
    authority { 0 }
  end
end
