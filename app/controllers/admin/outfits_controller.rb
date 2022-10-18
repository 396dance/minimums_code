class Admin::OutfitsController < ApplicationController
   # adminがログインしていないとページ見れない
  before_action :authenticate_admin!
  before_action :outfit_find, only: [:show, :destroy]

  def index
    @outfits = Outfit.all
  end

  def show
    # @outfit = Outfit.find(params[:id])
    @outfit_comment = OutfitComment.new
  end

  def destroy
    # @outfit = Outfit.find(params[:id])
    @outfit.destroy
    redirect_to admin_outfits_path
  end
  
  private
  
  def outfit_find
    @outfit = Outfit.find(params[:id])
  end
end
