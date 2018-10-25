class Recipe < ApplicationRecord
	belongs_to :user
	has_many :favourites
	has_many :reviews

	scope :names, -> (name) { where("name ILIKE ?", "%#{name}%")}
	# scope :tags, -> (tag) { where("tags include ?", "%#{tag}%") }
end
