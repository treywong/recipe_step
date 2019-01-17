class Review < ApplicationRecord
	belongs_to :user
	belongs_to :recipe

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
