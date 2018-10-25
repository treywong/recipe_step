class SearchesController < ApplicationController
	def _search
		@recipe = Recipe.all
		
		@recipe = @recipe.names(params[:name]) if params[:name].present?
		# @recipe = @recipe.tags(params[:tag]) if params[:tag].present?

		render "index"
	end

	def index

	end
end
