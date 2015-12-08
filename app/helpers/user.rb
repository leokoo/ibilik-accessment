helpers do 
	# This will return the current user, if they exit
	def current_user
		if session[:user_id]
			@current_user ||= User.find_by_id(session[:user_id])
		end
	end
	# Return true if current_user exist, false others
	def logged_in?
		!current_user.nil?
	end
end