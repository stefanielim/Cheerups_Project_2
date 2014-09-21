class Cheerup < ActiveRecord::Base

  attr_accessible :content , :user_id , :created_at, :updated_at

  belongs_to :user

  validates :user_id, presence: true
  validates :content, presence: true
  validates_length_of :content, maximum: 141
end
