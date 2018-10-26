class UsersController < ApplicationController
	helper UsersHelper

	def signup
		@user = User.new
	end

	def signup_create
		@user = User.new(user_params)
		if @user.save
			redirect_to root_path
		end
	end

	def login
		@user = User.new
	end

	def login_check
		@user = User.find_by(email: params[:user][:email])
		if @user && @user.authenticate(params[:user][:password])
			session[:user_id] = @user.id
			redirect_to root_path
		else
			redirect_back(fallback_location: root_path)
		end
	end

	def logout
		session[:user_id] = nil
		@user = nil
		redirect_to root_path
	end

	private
	def user_params
	  params.require(:user).permit(:username, :email, :password)
	end
end
