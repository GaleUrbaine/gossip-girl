# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

User.destroy_all
Gossip.destroy_all
Comment.destroy_all
City.destroy_all
Tag.destroy_all
Like.destroy_all
PrivateMessage.destroy_all

10.times do |city|
	City.create!(name: Faker::TvShows::GameOfThrones.city, zip_code: Faker::Address.zip_code)
end

10.times do |user|
	User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::TvShows::RickAndMorty.quote, email: Faker::Internet.email, age: rand(10..74), city_id: City.all.sample.id, password: "claudia")
end

24.times do |gossip|
	Gossip.create!(title: Faker::Lorem.characters(10), content: Faker::ChuckNorris.fact, user_id: User.all.sample.id)
end

10.times do |tag|
	Tag.create!(title: Faker::Book.genre)
end

20.times do |gossiptag|
	GossipsTag.create!(gossip_id: Gossip.all.sample.id, tag_id: Tag.all.sample.id)
end

10.times do |pm|
	PrivateMessage.create!(content: Faker::TvShows::FamilyGuy.quote, sender: User.all.sample, recipient: User.all.sample)
end

20.times do |comment|
	Comment.create!(content: Faker::TvShows::FamilyGuy.quote, user_id: User.all.sample.id, gossip_id: Gossip.all.sample.id)
end

20.times do |like|
	Like.create!(user_id: User.all.sample.id, gossip_id: Gossip.all.sample.id)
end
