FactoryBot.define do
  factory :user do
    email { Faker::Internet.unique.email }
    password { "password123" }
    password_confirmation { "password123" }
    role { :student }

    trait :teacher do
      role { :teacher }
    end

    trait :admin do
      role { :admin }
    end
  end
end