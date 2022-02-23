class CartitemsController < ApplicationController
  before_action :is_loggedin, only: %i(create)
    
  def create
    @cartitem = Cartitem.new(params)

    if @cartitem.save
      redirect_to carts_path, notice: "Successfully Added Item"
    else
      redirect_to carts_path, notice: "Unable to add item"
    end
  end

  private

  def cartitem_params
    params.require(:cartitem).permit(:quantity, :product_id, :cart_id)
  end
end
