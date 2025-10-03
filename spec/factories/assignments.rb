FactoryBot.define do
  factory :assignment do
    title { "Tarefa #{Faker::Lorem.word}" }
    description { Faker::Lorem.sentence }
    status { :pending }
    lesson
    association :user, factory: :user
  end
end
