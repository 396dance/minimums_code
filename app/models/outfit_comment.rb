class OutfitComment < ApplicationRecord

  # コメントはユーザーに属する
  belongs_to :user
  # コメントは服装の投稿に属する
  belongs_to :outfit

  validates :comment, presence: true
end
