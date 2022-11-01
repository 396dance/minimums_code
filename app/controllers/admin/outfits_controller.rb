class Admin::OutfitsController < ApplicationController
  # adminがログインしていないとページ見れない
  before_action :authenticate_admin!
  before_action :outfit_find, only: [:show, :destroy]

  def index
    @outfits = Outfit.page(params[:page])
  end

  def show
    @outfit_comment = OutfitComment.page(params[:page])
  end

  def destroy
    @outfit.destroy
    redirect_to admin_outfits_path
  end

  private
  def outfit_find
    @outfit = Outfit.find(params[:id])
  end

end
