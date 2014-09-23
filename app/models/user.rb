class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable,
  :omniauthable, :omniauth_providers => [:facebook]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
  :name, :user_name , :role, :status, :profile_picture, :prominence

  mount_uploader :profile_picture, ProfilePictureUploader

  validates :name, presence: true, allow_blank: false
  validates :user_name, presence: true, allow_blank: false
  validates :user_name, uniqueness: true

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.name = auth.info.first_name
      user.user_name = auth.info.email
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      # raise
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

#creates fake users using fake gem
#User.create(name: "test5",user_name: "test512", email: 'test5@gmail.com',password: 'password',password_confirmation: "password")

  def create_test_users
   
    name = Faker::Name.name
    uname = name.split(' ')[0]
    email = Faker::Internet.email
    password = "password"
    User.create(name: name,user_name: uname, email: email, password: password,  password_confirmation: password)

  end

  def create_test_cheerups_data
   3.times do  
    Cheerup.create(content: Faker::Hacker.say_something_smart, user_id: self.id, prominence: 0)
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

end
