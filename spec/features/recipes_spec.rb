require 'rails_helper'

RSpec.feature "Recipes", type: :feature do
  	describe "the create recipe process", type: :feature do
	  before :each do
	    User.create(username: "Someone", email: 'user@example.com', password: 'password')
	  end

	  it "create new recipe" do
	    visit '/login'
	    within("#new_user") do
	      fill_in 'Email', with: 'user@example.com'
	      fill_in 'Password', with: 'password'
	    end
	    click_button 'Sign in'
	    click_link 'Your recipes'
	    click_link 'Create a new recipe'

	    within("#new_recipe") do
	      fill_in 'Name', with: 'Super Pasta'
	      fill_in 'Cooktime', with: '1 hour'
	      fill_in 'Ingredients', with: 'pasta, superman'
	      fill_in 'Tags', with: 'pasta, superhero'
	    end
	    click_button 'Create Recipe'
	    expect(page).to have_content 'Super Pasta'
	  end
	end
end
