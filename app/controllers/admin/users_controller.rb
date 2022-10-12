class Admin::UsersController < ApplicationController
  # adminがログインしていないとページ見れない
  before_action :authenticate_admin!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @outfits = @user.outfits
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to admin_user_path(@user.id)
  end

  private
  def user_params
    params.require(:user). permit(:nickname, :introduction, :profile_image, :height, :is_deleted)
  end

end
