class Public::HomesController < ApplicationController

  def top
    @outfits = Outfit.all
  end

end
