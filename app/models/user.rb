class User < ActiveRecord::Base
  has_many :prices
  has_many :cars, through :prices

  validates :username, presence: true
  # validates :username, {format: /\A\z/}
  validates :name, presence: true

end
