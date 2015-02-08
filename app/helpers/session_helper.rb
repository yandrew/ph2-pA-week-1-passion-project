def user_at_email(email)
	User.find_by_email(email)
end

def user_is_authenticated?(user, password)
	return false if user.blank?
	user.authenticate(password) ? true : false
end


def logged_in?
	!!session[:current_user]
end


def session_set_current_user(user)
	session[:current_user] = user
end

def session_user_prices
	session[:current_user].prices
end

def session_logout
	session.delete :current_user
end
