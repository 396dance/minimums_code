class Users::SessionsController < Devise::SessionsController
  def guest_sign_in
    user = User.guest
    # ゲストユーザーをログイン状態にする
    sign_in user
    redirect_to outfits_path, notice: 'ゲストユーザーとしてログインしました。'
  end



end