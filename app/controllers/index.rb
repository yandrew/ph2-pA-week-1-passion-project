#User.cars or User.prices gets cars or prices for that instance of user. 


get '/' do
	erb :index
end

post '/' do 
"posting"
end

get '/login' do
	erb :login
end

#authenticates login
post '/login' do
	# @email = params[:email]
	@user = user_at_email(params[:email])
	if user_is_authenticated?(@user, params[:password])
		session_set_current_user(@user)
	redirect '/'
	else
		erb :login
	end
end

# display register page
get '/register' do
	if logged_in?
		redirect '/'
	else
		erb :register
	end
end

# goes to homepage or back to register page
post '/register' do
"after register"
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
	if logged_in?
		erb :new_price
	else
		redirect '/login'
	end
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



