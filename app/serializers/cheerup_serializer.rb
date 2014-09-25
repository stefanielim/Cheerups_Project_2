class CheerupSerializer < ActiveModel::Serializer
  attributes :id , :content , :cheerup_image, :prominence, :upvote , :downvote, :user_name
  
 
  def upvote
    object.get_upvotes.size
  end

  def downvote
    object.get_downvotes.size
  end

  def user_name
      object.user.name
  end
end
