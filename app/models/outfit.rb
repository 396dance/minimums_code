class Outfit < ApplicationRecord
  # 服装テーブルで画像を扱えるようにする
  has_one_attached :image

  # 服装はユーザーに属する
  belongs_to :user
end
