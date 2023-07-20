FactoryBot.define do
  factory :worker do
    name { Faker::Name.name }
    group { Worker.groups.values.sample }
  end
end
