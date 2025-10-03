FactoryBot.define do
  factory :enrollment do
    association :user, factory: :user
    association :course
  end
end
