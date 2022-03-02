class CartitemsController < ApplicationController
  before_action :is_loggedin, only: %i(create update destroy)
    
  def create
    @cartitem = current_user.cart.cartitems.find_or_initialize_by(product_id: params[:product_id])

    if @cartitem.quantity == nil
      @cartitem.attributes = cartitem_params
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
    if @cartitem.update(quantity: @cartitem.quantity + 1)
      redirect_to carts_path, notice: "Quantity Increased"
    else 
      redirect_to carts_path, notice: @cartitem.errors.messages_for(:quantity)
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

end
