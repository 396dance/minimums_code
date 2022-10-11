class Admin::OutfitsController < ApplicationController
   # adminがログインしていないとページ見れない
  before_action :authenticate_admin!

  def index
    @outfits = Outfit.all
  end

  def show
    @outfit = Outfit.find(params[:id])
    @outfit_comment = OutfitComment.new
  end
end
