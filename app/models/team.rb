class Team < ApplicationRecord

  belongs_to :owner, class_name: 'User', foreign_key: 'user_id'
  has_many :members, dependent: :destroy
  has_many :team_members, through: :members, source: :user

end
