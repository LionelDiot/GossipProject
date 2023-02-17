class Comment < ApplicationRecord
  belongs_to :gossip
  validates :content, presence: true
  validates :gossip, presence: true
  
end
