class Public::OutfitCommentsController < ApplicationController

  def create
    outfit = Outfit.find(params[:outfit_id])
    comment = current_user.outfit_comments.new(outfit_comment_params)
    comment.outfit_id = outfit.id
    comment.save
    redirect_to outfit_path(outfit.id)
  end

  private
  def outfit_comment_params
    params.reqire(:outfit_comment).permit(:comment)
  end
end
