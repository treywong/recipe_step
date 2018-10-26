# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = {}
recipe = {}
favourite = {}
review = {}
user['password'] = 'asdf'

ActiveRecord::Base.transaction do
	50.times do
		user['username'] = Faker::Internet.username
    	user["email"] = Faker::Internet.email
    	user["image_profile"] = Faker::Avatar.image

		User.create(user)
	end

	user_ids = User.ids

	200.times do
		recipe['name'] = Faker::Food.dish
		recipe['description'] = Faker::Food.description
		recipe['cooktime'] = rand(0..12).to_s + " hour " + rand(0..59).to_s + " min"
		recipe['instruction'] = Faker::Hipster.paragraph
	
		recipe['ingredients'] = []
		rand(5..10).times do
			recipe['ingredients'] << Faker::Food.measurement + " " + Faker::Food.ingredient
		end

		recipe['tags'] = []
		rand(1..7).times do
			recipe['tags'] << Faker::Restaurant.type
		end

		recipe["user_id"] = user_ids.sample
		Recipe.create(recipe)
	end

	recipe_ids = Recipe.ids

	user_ids.each do |u|
		favourite['user_id'] = u
		favourite['recipe_id'] = recipe_ids.sample

		Favourite.create(favourite)

		review['title'] = Faker::FamousLastWords.last_words
		review['rating'] = rand(1..5)
		review['description'] = Faker::Restaurant.review

		review['user_id'] = u
		review['recipe_id'] = recipe_ids.sample
		Review.create(review)
	end

	user['username'] = "Admin"
	user["email"] = "master@example.com"
	user["image_profile"] = Faker::Avatar.image
	user['role'] = "admin"

	User.create(user)
end

