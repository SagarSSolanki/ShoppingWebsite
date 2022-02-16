class User < ApplicationRecord
  has_secure_password
  has_many :addresses
  
  validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "Invalid Email!" }
end
