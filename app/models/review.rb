class Review < ApplicationRecord
	belongs_to :user
	belongs_to :recipe

	after_create do |review|
		@recipe = Recipe.find_by(id: review.recipe_id)
		@recipe.overall_rate = Review.overall_rating(review.recipe_id)
		@recipe.save
	end

	after_update do |review|
		@recipe = Recipe.find_by(id: review.recipe_id)
		@recipe.overall_rate = Review.overall_rating(review.recipe_id)
		@recipe.save
	end

	after_destroy do |review|
		@recipe = Recipe.find_by(id: review.recipe_id)
		@recipe.overall_rate = Review.overall_rating(review.recipe_id)
		@recipe.save
	end

	def self.overall_rating(recipe_id)
		@review = Review.all.where(recipe_id: recipe_id)

		@overall_rating = 0
		if @review.count != 0
			@review.each do |r|
				@overall_rating += r.rating
			end
			@overall_rating = @overall_rating / @review.count
		end
		return @overall_rating
	end
end
