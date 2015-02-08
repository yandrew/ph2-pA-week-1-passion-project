cars = {
	"Aston Martin" => ["DB9"], 
	"BMW" => ["328i", "M3", "M6", "i8", "i3"],
	"Chevrolet" => ["Corvette Z06"], 
	"Dodge" => ["Challenger"], 
	"Ford" => ["Focus", "Flex", "Escape", "Fusion"], 
	"Ferrari" => ["California", "458Italia"], 
	"Honda" => ["Fit EX", "Accord EX"], 
	"Jaguar" => ["F-Type R"], 
	"Mercedes" => ["SLS-Class SLS AMG GT Final Edition"], 
	"Nissan" => ["370Z", "Altima", ""], 
	"Subaru" => ["BRZ", "WRX"], 
	"Tesla" => ["Model S"], 
	"Toyota" => ["FRS"], 
	"Volkwagen" => ["GTI"]
}

years = (2008..2015).to_a

cars.each do |key, models|
	models.each do |model|
		Car.create({ make: key, model: model, year: years.sample })
	end
end

User.create({name: "Andrew Yan", email: "yandrew@gmail.com", password: "1"})

Price.create({ cost: 200000,user_id: 1, car_id: 1})