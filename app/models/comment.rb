class Comment < ApplicationRecord

  belongs_to :task
  belongs_to :user

  #アクティビティ・通知機能：コメント通知
  has_many :notifications, dependent: :destroy

  #Validation
  validates :body, presence: true, length: { maximum: 300 }

end
