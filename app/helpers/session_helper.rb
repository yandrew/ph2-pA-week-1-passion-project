def is_authenticated?
	
end


def logged_in
	is_authenticated?
	true
end


def session_set_current_user(user)
	if authenticate
		session[:current_user] = user
	end
end


def session_current_user

	
end



# def user_at(user_id)
# 	User.find(user_id)

# end
