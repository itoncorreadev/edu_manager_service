FactoryBot.define do
  factory :material do
    title { "MyString" }
    content { "MyText" }
    content_type { "MyString" }
    lesson { nil }
  end
end
