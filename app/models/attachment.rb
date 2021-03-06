class Attachment < ApplicationRecord

  mount_uploader :image, ImageUploader
  belongs_to :task
  belongs_to :user

  #Validation
  validates :image, presence: true

end
