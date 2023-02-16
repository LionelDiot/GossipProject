class Like < ApplicationRecord
  validates :gossip, presence: true
  validates :user, presence: true
  belongs_to :gossip
  belongs_to :user
end