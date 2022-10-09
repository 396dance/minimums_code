class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # ユーザーは服装をたくさん投稿できる
  has_many :outfits,         dependent: :destroy
  # ユーザーはたくさんコメントできる
  has_many :outfit_comments, dependent: :destroy
  # ユーザーはたくさんいいねできる
  has_many :favorites, dependent: :destroy

  # ユーザー画像を扱えるようにする
  has_one_attached :profile_image

  def get_profile_image(width,height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default_image.jpag', content_type: 'image/jpg')
    end
    profile_image.variant(resize_to_limit:[width,height]).processed
  end

  # ゲストログインするための記述
  def self.guest
    find_or_create_by!(nickname: 'guestuser' ,email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.nickname = "guestuser"
    end
  end

end
