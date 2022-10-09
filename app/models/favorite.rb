class Favorite < ApplicationRecord
  # いいねははユーザーに属する
  belongs_to :user
  # いいねは服装の投稿に属する
  belongs_to :outfit

  # 1人のユーザーはいいね1回まで
  # validates_uniqueness_of :outfit_id, scope: :user_id
end
