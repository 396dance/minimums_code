class Public::UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @outfits = @user.outfit
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  private
  def user_params
    params.require(:user). permit(:nickname, :introduction, :profile_image)
  end

end
