class Admin::OutfitsController < ApplicationController


  def index
    @outfits = Outfit.all
  end

  def show
    @outfit = Outfit.find(params[:id])
    @outfit_comment = OutfitComment.new
  end
end
