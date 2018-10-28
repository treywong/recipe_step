class User < ApplicationRecord
	has_secure_password
	has_many :recipes
	has_many :favourites
	has_many :reviews
	has_many :reports

	validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, presence: true, uniqueness: true
	validates :password, presence: true, length: { minimum: 8 }
end
