class RecipesController < ApplicationController
	def new
		@recipe = Recipe.new
	end

	def create
		@recipe = Recipe.new(recipe_params)
		@recipe.ingredients = params[:recipe][:ingredients].split(",")
		@recipe.tags = params[:recipe][:tags].split(",")
		@recipe.user_id = session[:user_id]
		if @recipe.save
			redirect_to user_recipe_path(session[:user_id])
		else
			redirect_to root_path
		end
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
		@recipe.ingredients = params[:recipe][:ingredients].split(",")
		@recipe.tags = params[:recipe][:tags].split(",")
		@recipe.save

		redirect_to "/recipes/#{params[:id]}"
	end

	def delete
		@recipe = Recipe.find_by(id: params[:id])
		@recipe.destroy
		redirect_to user_recipe_path(session[:user_id])
	end

	def user_recipe
		@user = User.find_by(id: params[:id])
		@recipe = Recipe.all.where(user_id: params[:id]).order(:created_at).page params[:page]
	end

	def favourite_new
		@favourite = Favourite.new(recipe_id: params[:id], user_id: session[:user_id])
		@favourite.save

		redirect_to "/recipes/#{params[:id]}"
	end

	def favourite_destroy
		@favourite = Favourite.find_by(recipe_id: params[:id], user_id: session[:user_id])
		@favourite.destroy

		redirect_to "/recipes/#{params[:id]}"
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
