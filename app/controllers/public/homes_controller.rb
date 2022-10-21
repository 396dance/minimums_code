class Public::HomesController < ApplicationController

  def top
    @all_ranks = Outfit.find(Favorite.group(:oufit_id).order('count(outfit_id) desc').limit(5).pluck(:outfit_id))
  end

end
