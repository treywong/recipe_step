class User < ApplicationRecord
	has_secure_password
	has_many :recipes
	has_many :favourites
	has_many :reviews
	has_many :reports

	validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, presence: true, uniqueness: true
	validates :password, presence: true, length: { minimum: 8 }

	before_create { generate_token(:auth_token) }

	mount_uploader :image_profile, AvatarUploader

	def generate_token(column)
		begin
			self[column] = SecureRandom.urlsafe_base64
		end while User.exists?(column => self[column])
	end

	def recipes_count
		recipes = Recipe.all.where(user_id: self.id)
		return recipes.count
	end
end
