class AdminsController < ApplicationController
	def user_management
		@user = User.all.where(role: "regular").order(:created_at).page params[:page]
		
	end
end
