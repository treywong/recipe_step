class ReviewsController < ApplicationController
	def new
		@review = Review.new
	end

	def create
		@review = Review.new(review_params)
		@review.user_id = current_user.id
		@review.recipe_id = params[:recipe_id]
		if @review.save
			redirect_to "/recipes/#{params[:recipe_id]}"
		else
			redirect_to root_path
		end
	end

	def edit
		@review = Review.find_by(recipe_id: params[:recipe_id], user_id: params[:user_id])
	end

	def update
		@review = Review.find_by(recipe_id: params[:recipe_id], user_id: params[:user_id])
		@review.update(review_params)
		@review.save

		redirect_to "/recipes/#{params[:recipe_id]}"
	end

	def delete
		@review = Review.find_by(recipe_id: params[:recipe_id], user_id: params[:user_id])
		@review.destroy
		redirect_to user_recipe_path(current_user.id)
	end

	private
	def review_params
		params.require(:review).permit(:title,:rating,:description)
	end
end
