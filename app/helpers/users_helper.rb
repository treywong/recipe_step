module UsersHelper
	def current_user
		if cookies[:auth_token]
			@current_user ||= User.find_by_auth_token!(cookies[:auth_token]) if cookies[:auth_token]
		end
	end

	def logged_in?
		!current_user.nil?
	end

	def sign_in(user)
		cookies[:auth_token] = user.auth_token
	end

	def sign_out
		cookies[:auth_token] = nil
	end

	def user_avatar user
	  if user.image_profile.present?
	    image_tag user.image_profile
	  else
	    # Assuming you have a default.jpg in your assets folder
	    image_tag 'empty_profile.jpeg'
	  end
	end
end
