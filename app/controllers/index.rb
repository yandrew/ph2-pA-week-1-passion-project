#User.cars or User.prices gets cars or prices for that instance of user. 


get '/' do
	erb :index
end

post '/' do 

end

get '/login' do
	erb :login
end

#authenticates login
post '/login' do

end

# display register page
get '/register' do
	erb :register
end

# goes to homepage or back to register page
post '/register' do

end

#logout
get '/logout' do |variable|
	session.delete :username
	redirect '/'
end



get '/cars/:id' do |id|
#shows page of prices for a specific car
	
	erb :car
end

get '/cars/:car_id/prices/new' do |car_id|
	erb :new_price
end

#shows page for editing a price. 
get '/cars/:car_id/prices/:price_id/edit' do |car_id, price_id|

end

#update specific price for car
put '/cars/:car_id/prices/:price_id/edit' do |car_id, price_id|

end

#deletes a price you've created in the past
delete '/cars/:car_id/prices/:price_id' do |car_id, price_id|
	
end



