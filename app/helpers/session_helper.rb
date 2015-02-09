

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

def fields_not_blank?(email,password,*name)
	if !!name[0]
		!email.blank? && !password.blank? && !name[0].blank?
	else
		!email.blank? && !password.blank?
	end
end

def any_blank_fields?(email, password, name)
	email.blank? || password.blank? || name.blank?
end


# def add_blank_error_message(user)
# 	user.errors.add(:name, "Please enter all required fields")	
# end

# def reg_error_handling(user)
# 	if user.errors.any?
# 	  erb :register
# 	else
# 	  redirect '/cars'
# 	end
# end

 #  def check_add_errors(user)
	# #check if blank and add errors
    
 #  end
