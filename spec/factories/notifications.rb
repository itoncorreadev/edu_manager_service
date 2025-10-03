FactoryBot.define do
  factory :notification do
    message { Faker::Lorem.sentence }
    read { false }
    user
  end
end
