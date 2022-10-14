class Outfit < ApplicationRecord
  # 服装テーブルで画像を扱えるようにする
  has_one_attached :image

  # 服装の投稿はユーザーに属する
  belongs_to :user
  # 服装の投稿はたくさんコメントされる
  has_many :outfit_comments, dependent: :destroy
  # 服装の投稿はたくさんいいねされる
  has_many :favorites, dependent: :destroy


  def self.looks(search, word)
    @outfit = Outfit.where("title LIKE?","%#{word}%")
  end

  # 「ログイン中のユーザーがその投稿に対していいねをしているか」を判断するメソッドを定義
  def favorited?(user)
    favorites.where(user_id: user.id).exists?
  end
end
