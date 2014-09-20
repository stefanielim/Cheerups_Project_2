class User < ActiveRecord::Base
  attr_accessible :name, :user_name , :role, :status

  validates :name, presence: true, allow_blank: false
  validates :user_name, presence: true, allow_blank: false
end
