class Task < ApplicationRecord

  belongs_to :user
  belongs_to :category

  has_many :descriptions
  has_many :subtasks
  has_many :comments

  validates :title, presence: true

end
