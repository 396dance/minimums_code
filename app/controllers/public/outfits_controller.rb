class Public::OutfitsController < ApplicationController
  def index
    @outfit = Outfit.new
    @outfits = Outfit.all
    @users = User.all
  end

  def create
    outfit = Outfit.new(outfit_params)
    outfit.user_id = current_user.id
    outfit.save
    redirect_to outfits_path
  end

  def show
    @outfit = Outfit.find(params[:id])
    @outfit_comment = OutfitComment.new
    @outfit_comments = OutfitComment.all
  end

  private
  def outfit_params
    params.require(:outfit).permit(:image, :title, :body)
  end
end
