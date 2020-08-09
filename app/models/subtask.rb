class Subtask < ApplicationRecord

  belongs_to :task
  belongs_to :user

  validates :name, presence: true, length: { maximum: 20 }

  def completed?
    !completed_at.blank?
  end

end
