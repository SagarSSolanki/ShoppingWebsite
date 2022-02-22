class Product < ApplicationRecord
  belongs_to :category

  validates :name, :price, :stock, :category_id, presence: true
end