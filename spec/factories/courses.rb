FactoryBot.define do
  factory :course do
    title { "Curso #{Faker::Educator.subject}" }
    description { Faker::Lorem.sentence }
    association :teacher, factory: :user, strategy: :create
  end
end
