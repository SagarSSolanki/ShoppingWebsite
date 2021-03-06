class User < ApplicationRecord
  has_secure_password
  has_many :addresses
  has_one :cart
  has_many :orders
  
  validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "Invalid Email!" }
  after_create :create_cart
  private

  def create_cart
    Cart.create({user_id: self.id})
  end
end
