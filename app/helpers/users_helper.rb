module UsersHelper
	def current_user
		if session[:user_id]
			@current_user ||= User.find_by_id(session[:user_id])
		end
	end

	def logged_in?
		!current_user.nil?
	end

	def sign_in(user)
		session[:user_id] = user.id
	end

	def sign_out
		session[:user_id] = nil
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
