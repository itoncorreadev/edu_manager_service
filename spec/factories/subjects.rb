FactoryBot.define do
  factory :subject do
    name { "Disciplina #{Faker::Educator.subject}" }
    association :course
  end
end
