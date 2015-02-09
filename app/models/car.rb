class Car < ActiveRecord::Base
	has_many :prices
	has_many :users, through: :prices
	
	validates :make, presence: true
	validates :model, presence: true
	validates :year, presence: true
end
