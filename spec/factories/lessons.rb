FactoryBot.define do
  factory :lesson do
    title { "Aula #{Faker::Educator.course_name}" }
    content { Faker::Lorem.paragraph }
    subject
  end
end
