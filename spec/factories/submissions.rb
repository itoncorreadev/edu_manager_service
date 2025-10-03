FactoryBot.define do
  factory :submission do
    content { "MyText" }
    assignment { nil }
    user { nil }
  end
end
