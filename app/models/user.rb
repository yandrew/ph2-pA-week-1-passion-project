class User < ActiveRecord::Base
  has_many :prices
  has_many :cars, through: :prices

  validates :email, presence: true
  validates :email, uniqueness: { message: "email has already been taken" }
  validates :email, format: { with: /\A[\w]{1,}\.?[\w]{1,}@[a-zA-Z0-9]{2,}\.[a-zA-Z0-9]{2,}\z/, message: "Not a valid email" }
  validates :name, presence: {message: "Must have a name"}
  validates :password_hash, presence: true

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
