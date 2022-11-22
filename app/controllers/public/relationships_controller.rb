class Public::RelationshipsController < ApplicationController
  # userがログインしていないとページ見れない
  before_action :authenticate_user!

  # フォローするとき
  def create
    current_user.follow(params[:user_id])
    redirect_to request.referer
  end

  def destroy
    current_user.unfollow(params[:user_id])
    redirect_to request.referer
  end

  # フォロー一覧
  def followings
    @outfit = Outfit.new
    @user = User.find(params[:user_id])
    @users = @user.followings
  end

  # フォロワー一覧
  def followers
    @outfit = Outfit.new
    @user = User.find(params[:user_id])
    @users = @user.followers
  end

end
