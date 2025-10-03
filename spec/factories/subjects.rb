FactoryBot.define do
  factory :subject do
    name { Faker::Educator.subject }
    course
  end
end
