class User < ActiveRecord::Base
  has_many :prices
  has_many :cars, through: :prices

  validates :email, presence: true
  validates :email, format: { with: /\A[\w]{2,}@[a-zA-Z0-9]{2,}\.[a-zA-Z0-9]{2,}\z/ }
  validates :name, presence: true
  validates :password, presence: true

 # users.password_hash in the database is a :string
  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def authenticate(password)
    self.password == password
  end

end
