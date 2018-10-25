class RecipesController < ApplicationController
	def new
		@recipe = Recipe.new
	end

	def create
		@recipe = Recipe.new(recipe_params)
		@recipe.ingredients = params[:recipe][:ingredients].split(",")
		@recipe.user_id = current_user.id
		@recipe.save

		redirect_to root_path
	end

	def show
		@recipe = Recipe.find_by(id: params[:id])
		@review = Review.all.where(recipe_id: params[:id])
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
		@recipe.save

		redirect_to "/recipe/#{params[:id]}"
	end

	def delete
		@recipe = Recipe.find_by(id: params[:id])
		@recipe.destroy
		redirect_to root_path
	end

	def user_recipe
		@user = User.find_by(id: params[:id])
		@recipe = Recipe.all.where(user_id: params[:id]).order(:created_at).page params[:page]
	end

	def favourite
		@recipe = []
		favourite = Favourite.all.where(user_id: params[:id])

		favourite.each do |f|
			@recipe << f.recipe
		end

	end

	private
	def recipe_params
		params.require(:recipe).permit(:name,:description,:cooktime,:tags,:ingredients,:instruction,:images)
	end
end
