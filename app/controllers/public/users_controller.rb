class Public::UsersController < ApplicationController

  def show
    @user = current_user
    @outfits = @user.outfit
  end

  def edit

  end

end
