class Product < ApplicationRecord
  belongs_to :category

  validates :name, :price, :stock, :category_id, presence: true
  has_one_attached :image 
end
