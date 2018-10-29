class UsersController < ApplicationController
	def index
	end

	def show
		@user = User.find_by(id: params[:id])
	end

	def signup
		@user = User.new
	end

	def signup_create
		@user = User.new(user_params)
		if @user.save
			redirect_to root_path
		else
			redirect_to "/signup"
		end
	end

	def login
		@user = User.new
	end

	def login_check
		@user = User.find_by(email: params[:user][:email])
		if @user && @user.authenticate(params[:user][:password])
			if params[:remember_me]
				cookies.permanent[:auth_token] = @user.auth_token
			else
				cookies[:auth_token] = @user.auth_token
			end
			redirect_to root_path
		else
			redirect_to "/login"
		end
	end

	def logout
		cookies.delete(:auth_token)
		@user = nil
		redirect_to root_path
	end

	private
	def user_params
	  params.require(:user).permit(:username, :email, :password)
	end
end
