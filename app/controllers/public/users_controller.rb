class Public::UsersController < ApplicationController
  # コントローラ内のeditアクションが実行される前に動作する
  before_action :ensure_guest_user, only: [:edit]
  # userがログインしていないとページ見れない
  before_action :authenticate_user!

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

  # いいねの一覧表示
  def favorites
    @user = User.find(params[:id])
    favorites = Favorite.where(user_id: @user.id).pluck(:outfit_id)
    @favorites_outfits = Outfit.find(favorites)
  end

  # 退会処理
  def quit
    @user = current_user
  end

  def close
    @user = current_user
    @user.update(is_deleted: true)
    sign_out
    flash[:notice] = "退会処理を実行しました"
    redirect_to root_path
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
