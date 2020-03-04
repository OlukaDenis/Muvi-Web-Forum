class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  before_save :downcase_email
  # before_save { email.downcase! } #Alternatively
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, 
                    length: { maximum: 255 }, 
                    format: {with: VALID_EMAIL_REGEX},
                    uniqueness: {case_sensitive: false} 
  PASSWORD_FORMAT = /\A(?=.{6,})(?=.*\d)(?=.*[a-z])/x #Contains atleast one uppercase, one lowercase and one digit
  validates :password, presence: true,
                      format:  { with: PASSWORD_FORMAT },
                      allow_nil: true
  # validates_confirmation_of :password
  has_many :questions, dependent: :destroy #when user is destroyed, all user questions will be destroyed tood
  has_many :answers, dependent: :destroy
  
  def admin?
    self.admin = true
  end

  # Defines a proto-feed.
  # See "Following users" for the full implementation.
  def feed
    Question.where("user_id = ?", id)
  end

  private

  def downcase_email
    self.email = email.downcase
  end

end