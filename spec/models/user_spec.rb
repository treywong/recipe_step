require 'rails_helper'

RSpec.describe User, type: :model do
	let(:proper_email)		{ 'test@example.com' }
	let(:proper_password)	{ 'Infinite' }
	let(:improper_email)	{ 'wwwabreger' }
	let(:improper_password_case)	{ 'infinite' }
	let(:improper_password_length)	{ 'Inf' }


	context "validation: " do
		it { is_expected.to validate_presence_of(:email) }
		it { should validate_uniqueness_of(:email) }

		it { is_expected.to validate_presence_of(:password) }
		it { is_expected.to allow_value(proper_password).for(:password) }
		it { is_expected.not_to allow_value(improper_password_length).for(:password) }
	end

	context "creates: " do
		it "takes in one valid email" do
			expect{ User.create(email: proper_email, password: proper_password ) }.not_to raise_error
		end

		it "won't create an entry if invalid email is being supplied" do
			User.create(email: improper_email, password: proper_password )
			expect( User.find_by(email: improper_email ) ).to be nil
		end

		it "won't create an entry if no password is being supplied" do
			User.create(email: proper_email )
			expect( User.find_by(email: proper_email ) ).to be nil
		end
	end
end

# 11 errors