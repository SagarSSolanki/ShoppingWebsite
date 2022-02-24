class CartitemsController < ApplicationController
  before_action :is_loggedin, only: %i(create)
    
  def create
    @cartitem = current_user.cart.cartitems.new(cartitem_params)
    if @cartitem.save
      redirect_to carts_path, notice: "Successfully Added Item"
    else
      redirect_to carts_path, notice: "Unable to add item"
    end
  end

  private

  def cartitem_params
    params.permit(:quantity, :product_id)
  end
end
