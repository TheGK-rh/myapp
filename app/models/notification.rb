class Notification < ApplicationRecord

  #通知機能(for notification function)
  default_scope -> { order(created_at: :desc) }
  belongs_to :visitor, class_name: 'User', foreign_key: 'visitor_id', optional: true
  belongs_to :visited, class_name: 'User', foreign_key: 'visited_id', optional: true

end