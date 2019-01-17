class RecipesController < ApplicationController
	def new
		@recipe = Recipe.new
	end

	def create
		@recipe = Recipe.new(recipe_params)
		@recipe.ingredients = params[:recipe][:ingredients].split(",")
		@recipe.tags = params[:recipe][:tags].split(",")
		@recipe.user_id = current_user.id
		@recipe.overall_rate = 0
		if @recipe.save
			redirect_to user_recipe_path(current_user.id)
		else
			redirect_to root_path
		end
	end

	def show
		@recipe = Recipe.find_by(id: params[:id])
		@review = Review.all.where(recipe_id: params[:id])

		if cookies[:auth_token]
			if Review.find_by(user_id: current_user.id, recipe_id: @recipe.id)
				@user_review = Review.find_by(user_id: current_user.id, recipe_id: @recipe.id)
			end
		end
	end

	def index
		@recipe = Recipe.all.order(:created_at).page params[:page]
	end

	def edit
		@recipe = Recipe.find_by(id: params[:id])
	end

	def update
		@recipe = Recipe.find_by(id: params[:id])
		@recipe.update(recipe_params)
		@recipe.ingredients = params[:recipe][:ingredients].split(",")
		@recipe.tags = params[:recipe][:tags].split(",")
		@recipe.save

		redirect_to "/recipes/#{params[:id]}"
	end

	def destroy
		@recipe = Recipe.find_by(id: params[:id])
		@recipe.destroy
		redirect_to user_recipe_path(current_user.id)
	end

	def user_recipe
		@user = User.find_by(id: params[:id])
		@recipe = Recipe.all.where(user_id: params[:id]).order(:created_at).page params[:page]
	end

	def favourite_new
		@favourite = Favourite.new(recipe_id: params[:id], user_id: current_user.id)
		@favourite.save

		redirect_to "/recipes/#{params[:id]}"
	end

	def favourite_destroy
		@favourite = Favourite.find_by(recipe_id: params[:id], user_id: current_user.id)
		@favourite.destroy

		redirect_to "/recipes/#{params[:id]}"
	end

	def favourite
		@user = User.find_by(id: params[:id])

		@recipe = []
		favourite = Favourite.all.where(user_id: params[:id])

		favourite.each do |f|
			@recipe << f.recipe
		end

	end

	def main_page
		@recipe_ids = Recipe.ids
	end

	private
	def recipe_params
		params.require(:recipe).permit(:name,:description,:cooktime,:tags,:ingredients,:instruction,:images)
	end
end
