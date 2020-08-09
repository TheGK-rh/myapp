class Task < ApplicationRecord

  belongs_to :user
  belongs_to :category

  has_many :descriptions
  has_many :subtasks
  has_many :comments
  has_many :task_tags, dependent: :destroy
  has_many :tags, through: :task_tags
  has_many :attachments

  validates :title, presence: true
  validates :category_id, presence: true

  def self.search(search)
    return Task.all unless search
    Task.where(['title LIKE ?', "%#{search}%"])
  end

end
