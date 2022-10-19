class Public::OutfitsController < ApplicationController
  # userがログインしていないとページ見れない(topページAboutページのみ見れる)
  before_action :authenticate_user!, except: [:top, :about]

  def index
    @outfit = Outfit.new
    @outfits = Outfit.all
    @users = User.all
    @outfits = params[:tag_id].present? ? Tag.find(params[:tag_id]).outfits : Outfit.all
  end

  def create
    outfit = Outfit.new(outfit_params)
    outfit.user_id = current_user.id
    outfit.save
    redirect_to outfit_path(outfit.id)
  end

  def show
    @user = User.find(params[:id])
    @outfit = Outfit.find(params[:id])
    @outfits = Outfit.new
    @outfit_comment = OutfitComment.new
  end

  def destroy
    @outfit = Outfit.find(params[:id])
    @outfit.destroy
    redirect_to outfits_path
  end

  private
  def outfit_params
    params.require(:outfit).permit(:image, :title, :body, tag_ids: [])
  end


end
