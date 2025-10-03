FactoryBot.define do
  factory :assignment do
    title { "MyString" }
    description { "MyText" }
    status { 1 }
    lesson { nil }
    user { nil }
  end
end
