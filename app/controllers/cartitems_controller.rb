class CartitemsController < ApplicationController
  before_action :is_loggedin, only: %i(create)
  after_action :total_update, only: %i(create update destroy)
    
  def create
    flag = 0

    current_user.cart.cartitems.each do |item|

      if item.product.id == params[:product_id].to_i
        flag = 1
        @cartitem = item
        break
      end
    end

    if flag == 0
      @cartitem = current_user.cart.cartitems.new(cartitem_params)
      @cartitem.save
      redirect_to carts_path, notice: "Successfully Added Item"

    elsif @cartitem.quantity < @cartitem.product.stock
      @cartitem.update(quantity: @cartitem.quantity + 1)
      redirect_to carts_path, notice: "Quantity Increased"

    else 
      redirect_to carts_path, notice: "No more products left!"
    end
  end

  def update
    @cartitem = current_user.cart.cartitems.find_by(id: params[:id])

    if @cartitem.quantity+1 <= @cartitem.product.stock
      @cartitem.update(quantity: @cartitem.quantity + 1)
      redirect_to carts_path, notice: "Quantity Increased"
    else
      redirect_to carts_path, notice: "No more products left!"
    end
  end

  def destroy 
    @cartitem = current_user.cart.cartitems.find_by(id: params[:id])
    @cartitem.destroy 
    redirect_to carts_path, notice: "1 Product Removed!"
  end

  private

  def cartitem_params
    params.permit(:quantity, :product_id)
  end

  def total_update
    sum = 0
    
    current_user.cart.cartitems.each do |item|
      sum = sum + (item.product.price * item.quantity)
    end
    @cart = current_user.cart
    @cart.update(total: sum)
  end
end
