class Description < ApplicationRecord

  belongs_to :task
  belongs_to :user

  #Validation
  validates :description, presence: true, length: { maximum: 350 }

end
