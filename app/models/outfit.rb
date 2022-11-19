class Outfit < ApplicationRecord

  has_one_attached :image

  validates :image, presence: true
  validates :body, presence: true
  validates :body, length: { maximum: 500 }

  belongs_to :user
  has_many :outfit_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :outfit_tags, dependent: :destroy
  has_many :tags, through: :outfit_tags, dependent: :destroy

  scope :latest, -> {order(updated_at: :desc)}
  scope :old, -> {order(updated_at: :asc)}

  def self.looks(search, word)
    @outfit = Outfit.where("body LIKE?","%#{word}%")
  end

  # 「ログイン中のユーザーがその投稿に対していいねをしているか」を判断するメソッドを定義
  def favorited?(user)
    favorites.where(user_id: user.id).exists?
  end
end
