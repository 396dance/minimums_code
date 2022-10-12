class Public::UsersController < ApplicationController
  # コントローラ内のeditアクションが実行される前に動作する
  before_action :ensure_guest_user, only: [:edit]
  # コントローラ内のedit,update,destroyアクションが実行される前に動作する
  before_action :ensure_user, only: [:edit, :update, :destroy]

  def show
    @user = User.find(params[:id])
    @outfits = @user.outfits
  end

  def edit
    @user = User.find(params[:id])
    # URLに直接編集ページを入力した際、ログインユーザーじゃなければ開けないようにする
    unless @user == current_user
      redirect_to user_path(@user), notice: 'ログインユーザーではないため、プロフィール編集画面は開けません'
    else
      render :edit
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  private
  def user_params
    params.require(:user). permit(:nickname, :introduction, :profile_image, :height)
  end

  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.nickname == "guestuser"
      redirect_to user_path(current_user) , notice: 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
    end
  end

end
