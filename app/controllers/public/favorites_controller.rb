class Public::FavoritesController < ApplicationController

  def create
    @favorite = Favorite.new(user_id: current_user.id, outfit_id: params[:outfit_id])
    @favorite.save
    @outfit = Outfit.find(params[:outfit_id])
  end

  def destroy
    @favorite = Favorite.find_by(user_id: current_user.id, outfit_id: params[:outfit_id])
    @favorite.destroy
    @outfit = Outfit.find(params[:outfit_id])
  end

end
