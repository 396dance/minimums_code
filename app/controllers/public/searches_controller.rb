class Public::SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @outfit = Outfit.new
    @range = params[:range]
    @users = []
    @outfits = []

    if params[:word].blank?
      return
    end

    if @range == "ニックネーム"
      @users = User.looks(params[:search], params[:word])
    else
      @outfits = Outfit.looks(params[:search], params[:word])
    end
  end

end
