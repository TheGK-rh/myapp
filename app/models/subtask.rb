class Subtask < ApplicationRecord

  belongs_to :task
  belongs_to :user

  #Validation
  validates :name, presence: true, length: { maximum: 100 }

  #完了機能
  def completed?
    !completed_at.blank?
  end

end
