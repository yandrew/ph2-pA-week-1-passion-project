class User < ActiveRecord::Base
  has_many :prices
  has_many :cars, through: :prices

  validates :email, presence: true
  validates :email, uniqueness: { message: "email has already been taken" }
  validates :email, format: { with: /\A[\w]{2,}@[a-zA-Z0-9]{2,}\.[a-zA-Z0-9]{2,}\z/, message: "Not a valid email" }
  validates :name, presence: {message: "Must have a name"}
  validates :password_hash, presence: true

# before_validation :validates_blank_password
# before_save
 # users.password_hash in the database is a :string
  include BCrypt

  # def pw_blank?
  #   self.password.blank?
  # end

  # def validates_blank_password
  #   errors.add(:password_hash, "Please enter a password") if pw_blank?
  # end

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
