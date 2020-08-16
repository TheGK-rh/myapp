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

  #Validation
  validates :title, presence: true, length: { maximum: 20 }
  validates :category_id, presence: true

  #検索機能
  def self.search(search)
    return Task.all unless search
    Task.where(['title LIKE ?', "%#{search}%"])
  end

end
