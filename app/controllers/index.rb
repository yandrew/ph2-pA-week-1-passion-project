#TODO: -stretch goal- redirect back to previous page if you go to login or register. 

#User.cars or User.prices gets cars or prices for that instance of user. 


get '/' do
	erb :index
end

post '/' do 
"posting"
end

get '/login' do
	redirect '/cars' if logged_in?
	
	erb :login
end

#authenticates login
post '/login' do
	@email = params[:email]
	@password = params[:password]
	@user = user_at_email(params[:email])
	
	if fields_not_blank?( @email, @password )
		if user_is_authenticated?( @user, @password )
			session_set_current_user(@user)
		redirect '/cars'
		else
			@login_error = "The email address or password you’ve entered is not valid."
			erb :login
		end
	else

		@login_error = "Please enter all required fields"
		erb :login
	end
end

# display register page
get '/register' do
	@user = nil
	redirect '/cars' if logged_in?
	erb :register
end

# goes to homepage or back to register page
post '/register' do
	@name = params[:name]
	@email = params[:email]
	@password = params[:password]
	if any_blank_fields?( @email, @password, @name)
		@errors = "Please enter all required fields"
		erb :register
	else
		@user = User.create(name: @name, email: @email, password: @password)
	
		if @user.errors[:email].any?
			@error_email = @user.errors[:email][0]
			erb :register 
		else
			redirect '/login'
		end	

	end
	
end

#logout
get '/logout' do
	session_logout
	redirect '/'
end

get '/cars' do
	erb :car
end

get '/cars/:id' do |id|
#shows page of prices for a specific car
	@car = Car.find(id)
	@id = id
	erb :prices
end

get '/cars/:car_id/prices/new' do |car_id|
	erb :new_price if logged_in?
		redirect '/login'
end

#shows page for editing a price. 
get '/cars/:car_id/prices/:price_id/edit' do |car_id, price_id|
	if logged_in?
		erb :edit
	else
		redirect '/login'
	end
end

#update specific price for car
put '/cars/:car_id/prices/:price_id/edit' do |car_id, price_id|

end

#deletes a price you've created in the past
delete '/cars/:car_id/prices/:price_id' do |car_id, price_id|
	
end



