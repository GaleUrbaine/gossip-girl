FactoryBot.define do
  factory :gossip do
    title { Faker::Lorem.characters(10)}
    content { Faker::ChuckNorris.fact }
    user_id { 19 }
  end
end
