FactoryBot.define do
  factory :material do
    title { "Material #{Faker::Educator.subject}" }
    content { Faker::Lorem.paragraph }
    content_type { ["video", "pdf", "link"].sample }
    lesson
  end
end
