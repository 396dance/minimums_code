class Public::OutfitCommentsController < ApplicationController

  def create
    @outfit = Outfit.find(params[:outfit_id])
    @comment = OutfitComment.new(outfit_comment_params)
    @comment.user_id = current_user.id
    @comment.outfit_id = @outfit.id
    @comment.save
    redirect_to outfit_path(@outfit.id)
  end


  private
  def outfit_comment_params
    params.require(:outfit_comment).permit(:comment)
  end
end
