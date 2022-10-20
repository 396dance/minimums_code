class Public::SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @outfit = Outfit.new
    @range = params[:range]

    if @range == "ニックネーム"
      @users = User.looks(params[:search], params[:word])
      # @users.include?
      # render search_path
    else
      @outfits = Outfit.looks(params[:search], params[:word])
    end
  end

end

# [{id:1 name: test}.{id:2 name: sample}.c.d.e.f]