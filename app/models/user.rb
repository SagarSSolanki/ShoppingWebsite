class User < ApplicationRecord
  has_secure_password
  has_many :addresses
  has_one :cart
  
  validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "Invalid Email!" }
  after_commit :create_cart, only: %i(create)
  private

  def create_cart
    Cart.create({user_id: self.id})
  end
end
