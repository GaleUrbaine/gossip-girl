FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    description { Faker::Lorem.paragraph(25) }
  end
end
