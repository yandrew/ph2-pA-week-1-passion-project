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

get '/cars/:id/prices' do |id|
#shows page of prices for a specific car
	@car = Car.find(id)
	@id = id
	erb :prices
end

get '/cars/:car_id/prices/new' do |car_id|
	# erb :new_price if logged_in?
	# redirect '/login'
	if logged_in?
		@car = Car.find(car_id)
		@id = car_id
		erb :new_price
	else
		redirect '/login'
	end
end

#creates a new price for that car. 
post '/cars/:car_id/prices/new' do |car_id|
	redirect '/login' unless logged_in?
	@price = Price.create({cost: params[:cost], user_id: session_current_user_id, car_id: car_id })
	if @price.errors[:cost].any?
		@errors = @price.errors[:cost][0]
		@car = Car.find(car_id)
		@id = car_id
		erb :new_price
	else
		redirect "/cars/#{car_id}/prices"
	end

end

#show a specific price and who submitted it.
get '/cars/:car_id/prices/:price_id' do |car_id, price_id|
	@car = Car.find(car_id)
	@id = car_id
	@price_id = price_id
	@price = Price.find(price_id)
	@user = @price.user
	erb :price_id
end



#display edit page specific price for car
get '/cars/:car_id/prices/:price_id/edit' do |car_id, price_id|
	redirect '/login' unless logged_in?
	@car = Car.find(car_id)
	@id = car_id
	@price_id = price_id
	@price = Price.find(price_id)
	@user = @price.user
	
	if @user != session[:current_user]
		@access = false
		@errors = "You're can only edit your submissions"
	end 
	erb :edit
end

put '/cars/:car_id/prices/:price_id' do |car_id, price_id|
	@price = Price.find(price_id)
	@price.cost = params[:cost]
	@price.save
	
	if @price.valid?
		redirect "/cars/#{car_id}/prices/#{price_id}" 
	else
		@error_cost = @price.errors[:cost][0]
		redirect "/cars/#{car_id}/prices/#{price_id}/edit"
	end
end


#deletes a price you've created in the past
delete '/cars/:car_id/prices/:price_id' do |car_id, price_id|
	
end



