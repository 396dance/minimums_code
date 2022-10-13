class Admin::CommentsController < ApplicationController
  def index
    @outfit_comments = OutfitComment.all
  end

  def destroy
    @outfit_comment = OutfitComment.find(params[:id])
    @outfit_comment.destroy
    redirect_to admin_comments_path
  end


end
