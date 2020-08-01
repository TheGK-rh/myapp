class Task < ApplicationRecord

  belongs_to :user
  belongs_to :category

  has_many :descriptions
  has_many :subtasks
  has_many :comments
  has_many :task_tags, dependent: :destroy
  has_many :tags, through: :task_tags

  validates :title, presence: true

end
