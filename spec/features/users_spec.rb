require 'rails_helper'

RSpec.feature "Users", type: :feature do
    describe "the signin process", type: :feature do
	  before :each do
	    User.create(username: "Someone", email: 'user@example.com', password: 'password')
	  end

	  it "signs me in" do
	    visit '/login'
	    within("#new_user") do
	      fill_in 'Email', with: 'user@example.com'
	      fill_in 'Password', with: 'password'
	    end
	    click_button 'Sign in'
	    expect(page).to have_content 'Someone'
	  end
	end
end
