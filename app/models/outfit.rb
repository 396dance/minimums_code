class Outfit < ApplicationRecord
  # 服装テーブルで画像を扱えるようにする
  has_one_attached :image

  # 服装の投稿はユーザーに属する
  belongs_to :user
  # 服装の投稿はたくさんコメントされる
  has_many   :outfit_comment, dependent: :destroy
end
