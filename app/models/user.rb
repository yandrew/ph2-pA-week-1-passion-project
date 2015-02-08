class User < ActiveRecord::Base
  has_many :prices
  has_many :cars, through: :prices

  validates :username, presence: true
  validates :username, format: { with: /\A[a-z0-9_-]{3,20}\z/}
  validates :name, presence: true

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
