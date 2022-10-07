class Public::UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @outfits = @user.outfit
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to users_mypage_path
  end

  private
  def user_params
    params.require(:user). permit(:nickname, :introduction, :profile_image)
  end

end
