class Public::OutfitCommentsController < ApplicationController

  def create
    @outfit = Outfit.find(params[:outfit_id])
    @outfit_comment = OutfitComment.new(outfit_comment_params)
    @outfit_comments = @outfit.outfit_comment
    @outfit_comment.user_id = current_user.id
    @outfit_comment.outfit_id = @outfit.id
    @outfit_comment.save
  end

  def destroy
    @outfit = Outfit.find(params[:outfit_id])
    @outfit_Comment = OutfitComment.find(params[:id])
    @outfit_comment.destroy
  end


  private
  def outfit_comment_params
    params.require(:outfit_comment).permit(:comment)
  end
end
