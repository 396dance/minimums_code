class Favorite < ApplicationRecord

  # いいねははユーザーに属する
  belongs_to :user
  # いいねは服装の投稿に属する
  belongs_to :outfit

end
