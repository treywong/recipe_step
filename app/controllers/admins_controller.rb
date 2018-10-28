class AdminsController < ApplicationController
	helper AdminsHelper

	def user_management
		if User.find_by_id(session[:user_id]).role != 'admin'
        	flash[:notice] = "Sorry. You are not allowed to perform this action."
        	return redirect_to root_path
      	end
		@user = User.all.where(role: "regular").order(:created_at).page params[:page]
	end

	def user_delete
		if User.find_by_id(session[:user_id]).role != 'admin'
        	flash[:notice] = "Sorry. You are not allowed to perform this action."
        	return redirect_to root_path
     	end
		@user = User.find_by(id: params[:id])
		@user.destroy
		redirect_to user_management_path
	end
end
