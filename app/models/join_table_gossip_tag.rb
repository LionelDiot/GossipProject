class JoinTableGossipTag < ApplicationRecord
  validates :gossip, presence: true
  validates :tag, presence: true
  belongs_to :gossip
  belongs_to :tag
end
