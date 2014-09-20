class User < ActiveRecord::Base
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
  :name, :user_name , :role, :status

  validates :name, presence: true, allow_blank: false
  validates :user_name, presence: true, allow_blank: false

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
