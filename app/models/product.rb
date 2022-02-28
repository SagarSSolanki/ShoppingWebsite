class Product < ApplicationRecord
  belongs_to :category
  has_many :cartitems
  has_many :orderitems
  validates :name, :price, :stock, :category_id, presence: true
  has_one_attached :image 
end
