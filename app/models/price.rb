class Price < ActiveRecord::Base
	belongs_to :user
	belongs_to :car
validates :cost, presence: {message: "cost can't be blank"}
validates :cost, format: { with: /\A[0-9]{2,}\z/, message: "Only numbers allowed and no commas" }
end

