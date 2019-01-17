class SearchesController < ApplicationController
	def _search
		@recipe = Recipe.all.order(:created_at).page params[:page]
		
		@recipe = @recipe.names(params[:name]) if params[:name].present?

		render "index"
	end

	def index
		
	end

	def advance_search

	end

	def advance_searching
		@name = params[:name]
		@recipe = Recipe.all
		
		@recipe = @recipe.names(params[:name]) if params[:name].present?
	    respond_to do |format|
	      # format.json { render json: @recipe.map {|r| [r, r.user.username] } }
	      format.js # remote: true is sent a js format and sends you to search.js.erb
	    end
	end
end
