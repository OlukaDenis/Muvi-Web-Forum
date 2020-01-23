class User < ApplicationRecord
  before_save { self.email = email.downcase }
  # before_save { email.downcase! } #Alternatively
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, 
                    length: { maximum: 255 }, 
                    format: {with: VALID_EMAIL_REGEX},
                    uniqueness: {case_sensitive: false} 
  has_secure_password
  PASSWORD_FORMAT = /\A(?=.{6,})(?=.*\d)(?=.*[a-z])/x #Contains atleast one uppercase, one lowercase and one digit
  validates :password, presence: true,
                      length: { maximum: 20 },
                      format:  { with: PASSWORD_FORMAT } 

  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end
