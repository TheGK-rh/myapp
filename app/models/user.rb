class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tasks

  has_many :descriptions
  has_many :comments
  has_many :attachments

  #Teamの設定
  has_many :teams, dependent: :destroy
  has_many :members
  has_many :memberships, through: :members, source: :team

  #フォロー機能の設定
  has_many :active_relationships, foreign_key: "follower_id", class_name: "Relationship", dependent: :destroy

  has_many :followings, through: :active_relationships, source: :following

  has_many :passive_relationships, foreign_key: "following_id", class_name: "Relationship", dependent: :destroy

  has_many :followers, through: :passive_relationships, source: :follower

  # ユーザーをフォローする
  def follow(other_user)
    active_relationships.create(following_id: other_user.id)
  end

  # ユーザーをアンフォローする
  def unfollow(other_user)
    active_relationships.find_by(following_id: other_user.id).destroy
  end

  # 現在のユーザーがフォローしてたらtrueを返す
  def following?(other_user)
    followings.include?(other_user)
  end

  #ユーザー検索
  def self.search(search)
    return User.all unless search
    User.where(['name LIKE ? OR email LIKE ?', "%#{search}%", "%#{search}%"])
  end

end
