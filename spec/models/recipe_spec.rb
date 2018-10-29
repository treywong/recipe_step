require 'rails_helper'

RSpec.describe Recipe, type: :model do

	let(:proper_email)		{ 'test@example.com' }
	let(:proper_email_2)		{ 'test_2@example.com' }
	let(:proper_password)	{ 'Infinite' }
	context "validation: " do
		it { is_expected.to validate_presence_of(:name) }
		it { is_expected.to validate_presence_of(:cooktime) }
		it { is_expected.to validate_presence_of(:ingredients) }
		it { is_expected.to validate_presence_of(:tags) }
	end

	context "favourites_count: " do
		it "count all the favourites in a recipe" do
			user = User.create(email: proper_email, password: proper_password )
			user2 = User.create(email: proper_email_2, password: proper_password )
			recipe = Recipe.create(name: "Food_1" , cooktime: "30 min" , ingredients: ['ham', 'cheese', 'bread'] , tags: ['sandwich'], user_id: user.id )
			favourite = Favourite.create(user_id: user2.id, recipe_id: recipe.id)
			expect( recipe.favourites_count ).to eql(1)
		end

		it "won't count all the favourites in an invalid recipe" do
			user = User.create(email: proper_email, password: proper_password )
			user2 = User.create(email: proper_email_2, password: proper_password )
			recipe = Recipe.create(name: "Food_1", user_id: user.id )
			favourite = Favourite.create(user_id: user2.id, recipe_id: recipe.id)
			expect( recipe.favourites_count ).to eql(0)
		end
	end
end