class Recipe < ApplicationRecord
	belongs_to :user
	has_many :favourites
	has_many :reviews

	scope :names, -> (name) { where("name ILIKE ?", "%#{name}%")}

	validates :name, presence: true
	validates :cooktime, presence: true
	validates :ingredients, presence: true
	validates :tags, presence: true
end
