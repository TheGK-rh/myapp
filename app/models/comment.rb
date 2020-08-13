class Comment < ApplicationRecord

  belongs_to :task
  belongs_to :user

  #Validation
  validates :body, presence: true, length: { maximum: 120 }

end
