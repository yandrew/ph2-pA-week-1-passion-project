class Price < ActiveRecord::Base
	belongs_to :user
	belongs_to :car

validates :cost, presence: {message: "cost can't be blank"}
end
