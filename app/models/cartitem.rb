class Cartitem < ApplicationRecord
  belongs_to :cart
  belongs_to :product
  validate :stock_quantity, on: %i(update)
  after_commit :total_update, only: %i(create update destroy)

  private 

  def total_update
    sum = self.cart.cartitems.sum { |item| item.product.price * item.quantity }
    self.cart.update(total: sum)
  end

  def stock_quantity 
    errors.add(:quantity, "No more products left!") if self.quantity > self.product&.stock
  end
end
