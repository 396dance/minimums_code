class Public::HomesController < ApplicationController

  def top
    @all_ranks = Outfit.find(Favorite.group(:outfit_id).order('count(outfit_id) desc').limit(5).pluck(:outfit_id))
    @tag = Tag.all
  end

end