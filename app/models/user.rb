class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable,
  :omniauthable, :omniauth_providers => [:facebook]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
  :name, :user_name , :role, :status, :profile_picture

  mount_uploader :profile_picture, ProfilePictureUploader

  validates :name, presence: true, allow_blank: false
  validates :user_name, presence: true, allow_blank: false

  def self.from_omniauth(auth)
    #raise
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.name = auth.info.first_name
      user.user_name = auth.info.email
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      #user.name = auth.info.name  # assuming the user model has a name
      #user.image = auth.info.image # assuming the user model has an image
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end


  has_many :cheerups #dependent: :destroy?

  acts_as_voter

  def can_destroy?
    # user can destroy himself or 
    # admin user can destroy anyone only until 1 admin user is left 
    if self.role == 'user' 
      return true
    elsif self.role == 'admin'
       return true if User.find_all_by_role("admin").count > 1
    else
      return false
    end
  end
end
