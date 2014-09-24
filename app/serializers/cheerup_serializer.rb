class CheerupSerializer < ActiveModel::Serializer
  attributes :id , :content , :cheerup_image, :prominence, :upvote , :downvote
  

  
  def upvote
    object.get_upvotes.size
  end

  def downvote
    object.get_downvotes.size
  end

end
