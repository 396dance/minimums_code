class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :nickname, uniqueness: true
  validates :nickname, length: { in: 2..20 }
  validates :introduction, length: { maximum: 200 }


  # ログイン時に退会済みのユーザーが同じアカウントでログイン出来ないよう制約を設ける
  # is_deletedがfalseならtrueを返すようにする
  def active_for_authentication?
    super && (is_deleted == false)
  end


  has_many :outfits, dependent: :destroy
  has_many :outfit_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  # ユーザーはたくさんフォローできる
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  # ユーザーはたくさんフォローされる
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy

  # フォローフォロワーを一覧画面で使うための記述
  has_many :followings, through: :relationships, source: :followed
  has_many :followers, through: :reverse_of_relationships, source: :follower

  # フォローした時の処理
  def follow(user_id)
    relationships.create(followed_id: user_id)
  end

  # フォローを外す時の処理
  def unfollow(user_id)
    relationships.find_by(followed_id: user_id).destroy
  end

  # フォローしているか判定
  def following?(user)
    followings.include?(user)
  end


  def self.looks(search, word)
    @user = User.where("nickname LIKE?","%#{word}%")
  end

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
