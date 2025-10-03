FactoryBot.define do
  factory :user do
    email { Faker::Internet.unique.email }
    password { "password" }
    role { :student }

    trait :teacher do
      role { :teacher }
    end

    trait :admin do
      role { :admin }
    end
  end
end
