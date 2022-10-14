class Public::SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @range = params[:range]

    if @range == "ニックネーム"
      @users = User.looks(params[:search], params[:word])
    else
      @outfits = Outfit.looks(params[:search], params[:word])
    end
  end

end
