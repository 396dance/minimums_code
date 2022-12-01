class Admin::OutfitCommentsController < ApplicationController

  def destroy
    @outfit = Outfit.find(params[:outfit_id])
    @outfit_comment = OutfitComment.find(params[:id])
    @outfit_comment.destroy
    redirect_to admin_comment_path(@outfit)
  end

end
