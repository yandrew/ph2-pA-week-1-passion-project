class Car < ActiveRecord::Base
	has_many :prices
	has_many :users, through: :prices
end
