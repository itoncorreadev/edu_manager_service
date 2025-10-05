FactoryBot.define do
  factory :lesson do
    title { "Aula #{Faker::Educator.subject}" }
    content { Faker::Lorem.paragraph }
    association :subject
  end
end
