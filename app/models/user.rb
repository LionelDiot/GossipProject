class User < ApplicationRecord
  validates :email,
            presence: true,
            uniqueness: true,
            format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: 'email adress please' }
  validates :first_name, presence: true        
  validates :last_name, presence: true
  validates :description,
            presence: true,
            length: { minimum: 20}
  validates :age,
            presence: true,
            numericality: { only_integer: true, greater_than_or_equal_to: 18 }
  validates :city, presence: true

  belongs_to :city
  has_many :gossips, dependent: :destroy
end
