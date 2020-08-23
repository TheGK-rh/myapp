class Task < ApplicationRecord

  belongs_to :user
  belongs_to :category

  #タスク基本機能
  has_many :descriptions
  has_many :subtasks
  has_many :comments
  has_many :task_tags, dependent: :destroy
  has_many :tags, through: :task_tags
  has_many :attachments

  #シェア機能
  has_many :shares, dependent: :destroy
  has_many :task_shares, through: :shares, source: :user

  #アクティビティ・通知機能
  has_many :notifications, dependent: :destroy

  #Validation
  validates :title, presence: true, length: { maximum: 50 }
  validates :category_id, presence: true

  #検索機能
  def self.search(search)
    return Task.all unless search
    Task.where(['title LIKE ?', "%#{search}%"])
  end

  #アクティビティ・通知機能：コメント通知
  def create_notification_comment!(current_user, comment_id)
    # 自分以外にコメントしている人をすべて取得し、全員に通知を送る
    temp_ids = Comment.select(:user_id).where(task_id: id).where.not(user_id: current_user.id).distinct
    temp_ids.each do |temp_id|
      save_notification_comment!(current_user, comment_id, temp_id['user_id'])
    end
    # まだ誰もコメントしていない場合は、投稿者に通知を送る
    save_notification_comment!(current_user, comment_id, user_id) if temp_ids.blank?
  end

  def save_notification_comment!(current_user, comment_id, visited_id)
    # コメントは複数回することが考えられるため、１つの投稿に複数回通知する
    notification = current_user.active_notifications.new(
      task_id: id,
      comment_id: comment_id,
      visited_id: visited_id,
      action: 'comment'
    )
    # 自分の投稿に対するコメントの場合は、通知済みとする
    if notification.visitor_id == notification.visited_id
      notification.checked = true
    end
    notification.save if notification.valid?
  end

end
