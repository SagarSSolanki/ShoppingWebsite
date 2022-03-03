class OrdersController < ApplicationController
  before_action :is_loggedin, only: %i(index create)
  before_action :availability_check, only: %i(create)

  def index
    @orders = current_user.orders.all.includes(:orderitems)
  end
    
  def create
    @cart = current_user.cart 
    @order = current_user.orders.create(total: current_user.cart.total)

    @cart.cartitems.each do |item|
      @order.orderitems.create(quantity: item.quantity, product_id: item.product_id)
      item.product.update(stock: item.product.stock - item.quantity)
      item.destroy
    end

    @cart.update(total: 0)
  end

  private

  def availability_check
    current_user.cart.cartitems.each do |item|
      redirect_to carts_path, notice: "Quantity of #{item.product.name} is no longer available!" if item.quantity > item.product.stock
    end
  end
end
