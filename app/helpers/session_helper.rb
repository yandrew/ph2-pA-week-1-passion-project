def user_at_email(email)
	User.find_by_email(email)
end

def is_authenticated?(user, password)
	return false if user.blank?
	user.authenticate(password) ? true : false
end


def logged_in?
	!!session[:current_user]
end


def session_set_current_user(user)
		session[:current_user] = user
end




