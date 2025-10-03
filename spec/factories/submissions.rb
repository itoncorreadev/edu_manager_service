FactoryBot.define do
  factory :submission do
    content { Faker::Lorem.paragraph }
    assignment
    user
  end
end
