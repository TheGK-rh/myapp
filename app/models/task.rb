class Task < ApplicationRecord

  belongs_to :user
  belongs_to :category

  has_many :descriptions
  has_many :subtasks

  validates :title, presence: true

end
