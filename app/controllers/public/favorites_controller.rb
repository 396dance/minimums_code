class Public::FavoritesController < ApplicationController

  def create
    @favorite = Favorite.new(user_id: current_user.id, outfit_id: params[:outfit_id])
    @favorite.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @favorite = Favorite.find_by(user_id: current_user.id, outfit_id: params[:outfit_id])
    @favorite.destroy
    redirect_back(fallback_location: root_path)
  end
end
