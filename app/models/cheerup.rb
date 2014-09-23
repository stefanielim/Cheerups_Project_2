class Cheerup < ActiveRecord::Base

  attr_accessible :content, :user_id, :cheerup_image
  mount_uploader :cheerup_image, CheerupImageUploader

  belongs_to :user

  validates :user_id, presence: true
  validates :content, presence: true
  validates_length_of :content, maximum: 141

  acts_as_votable
end
