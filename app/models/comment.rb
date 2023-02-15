class Comment < ApplicationRecord
  belongs_to :gossip
  validates :content, presence: true, length: { minimum: 6}
  validates :gossip, presence: true
  
end
