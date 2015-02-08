def session_set_current_user(user)
	if authenticate
		session[:current_user] = user
	end
end

def logged_in?

end

def find_user(user_id)
	User.find(user_id)

end