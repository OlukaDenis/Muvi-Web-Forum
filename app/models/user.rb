class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook google_oauth2 github]

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
  

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.name   # assuming the user model has a name
      user.image = auth.info.image # assuming the user model has an image
      # user.save
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      elsif data = session["devise.github_data"] && session["devise.github_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end


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