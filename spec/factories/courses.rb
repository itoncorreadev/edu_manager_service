FactoryBot.define do
  factory :course do
    title { "Curso #{Faker::Educator.course_name}" }
    description { Faker::Lorem.sentence }
    association :teacher, factory: [:user, :teacher]
  end
end
