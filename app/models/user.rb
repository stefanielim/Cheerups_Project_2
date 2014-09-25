class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :confirmable,
  :recoverable, :rememberable, :trackable, :validatable,
  :omniauthable, :omniauth_providers => [:facebook] 

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
  :name, :user_name , :role, :status, :profile_picture, :remote_profile_picture_url, :prominence, :reputation
  
  include Gravtastic
   gravtastic size: 75, default: "retro", secure: true 

  mount_uploader :profile_picture, ProfilePictureUploader

  validates :name, presence: true, allow_blank: false
  validates :user_name, presence: true, allow_blank: false
  validates :user_name, uniqueness: true

  def role?(role_to_compare)
    self.role.to_s == role_to_compare.to_s
    
  end


  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.name = auth.info.first_name
      user.user_name = auth.info.email
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      
      #user.name = auth.info.name  # assuming the user model has a name
      user.profile_picture = auth.info.image 
      # assuming the user model has an image
      # raise
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end


  has_many :cheerups , dependent: :destroy

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

  
  def calc_prominence
    cheerups.pluck(:prominence).sum
  end

  def set_prominence
    self.update_attributes(prominence: self.calc_prominence)
  end

  def self.sort_by_prominence
    User.all.sort_by(&:prominence).reverse
  end

  def update_reputation
    case
    when prominence > 10 && prominence <= 50
      reputation = 'Senior_Cheerupper'
    when prominence > 50
      reputation = 'Master_Cheerupper'
    when prominence < 0 && prominence >= -10
      reputation = 'Junior_Dragdowner'
    when prominence < -10 && prominence >= -50
      reputation = 'Senior_Dragdowner'
    when prominence < -50
      reputation = 'Master_Dragdowner'
    else
      reputation = 'Junior_Cheerupper'
    end

    self.update_attributes(reputation: reputation)
  end

end
