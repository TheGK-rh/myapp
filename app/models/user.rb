class User < ApplicationRecord

  #Deviseの設定
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #基本機能の設定
  has_many :tasks
  has_many :descriptions
  has_many :comments
  has_many :attachments

  #シェア機能
  has_many :shares
  has_many :shareships, through: :shares, source: :task

  #Teamの設定
  has_many :teams, dependent: :destroy
  has_many :members
  has_many :memberships, through: :members, source: :team

  #フォロー機能の設定
  has_many :active_relationships, foreign_key: "follower_id", class_name: "Relationship", dependent: :destroy
  has_many :followings, through: :active_relationships, source: :following
  has_many :passive_relationships, foreign_key: "following_id", class_name: "Relationship", dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :follower

  #アクティビティ・通知機能
  has_many :active_notifications, class_name: 'Notification', foreign_key: 'visitor_id', dependent: :destroy
  has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy

  #ゲストログイン機能
  def self.guest
    find_or_create_by!(name: 'ゲストユーザー', email: 'guest@example.com' ) do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end

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

  #アクティビティ・通知機能：フォロー通知
  def create_notification_follow!(current_user)
    temp = Notification.where(["visitor_id = ? and visited_id = ? and action = ?", current_user.id, id, 'follow'])
    if temp.blank?
      notification = current_user.active_notifications.new(
        visited_id: id,
        action: 'follow'
      )
      notification.save if notification.valid?
    end
  end

end
