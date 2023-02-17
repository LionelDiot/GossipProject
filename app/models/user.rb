class User < ApplicationRecord
  validates :email,
            presence: true,
            uniqueness: true,
            format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: 'email adress please' }
  validates :first_name, presence: true        
  validates :last_name, presence: true
  
  validates :age,
            presence: true,
            numericality: { only_integer: true, greater_than_or_equal_to: 18 }
  validates :city, presence: true
  validates :password, presence: true, length: { minimum: 6 }
  belongs_to :city
  has_many :gossips, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_secure_password

  def remember(remember_token)
    remember_digest2 = BCrypt::Password.create(remember_token)
    self.update(remember_digest: remember_digest2)
  end
end
