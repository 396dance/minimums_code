class Public::UsersController < ApplicationController
  # コントローラ内のeditアクションが実行される前に動作する
  before_action :ensure_guest_user, only: [:edit]

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

  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.nickname == "guestuser"
      redirect_to user_path(current_user) , notice: 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
    end
  end

end
