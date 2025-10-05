FactoryBot.define do
  factory :assignment do
    title { "Tarefa #{Faker::Lorem.word}" }
    description { Faker::Lorem.sentence }
    status { "pending" }
    association :lesson
  end
end
