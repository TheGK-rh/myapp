class Subtask < ApplicationRecord

  belongs_to :task
  belongs_to :user

  def completed?
    !completed_at.blank?
  end

end
