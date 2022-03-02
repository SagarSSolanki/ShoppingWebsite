class CartsController < ApplicationController
  before_action :is_loggedin, only: %i(index)
  
  def index
    @cart = current_user.cart
  end
end
