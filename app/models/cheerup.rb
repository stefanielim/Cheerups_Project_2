class Cheerup < ActiveRecord::Base

  attr_accessible :content, :user_id, :cheerup_image, :created_at, :updated_at, :prominence
  mount_uploader :cheerup_image, CheerupImageUploader

  belongs_to :user

  validates :user_id, presence: true
  validates :content, presence: true
  validates_length_of :content, maximum: 141

  acts_as_votable

  def calc_prominence
    upvotes = get_upvotes.size
    downvotes = get_downvotes.size
    upvotes - downvotes
  end

  def set_prominence
    self.update_attributes(prominence: self.calc_prominence)
  end

  def self.sort_by_prominence
    Cheerup.all.sort_by(&:prominence).reverse
  end


  

  def self.random_display
    Cheerup.all.shuffle
  end

end
