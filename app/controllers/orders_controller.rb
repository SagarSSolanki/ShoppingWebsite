class OrdersController < ApplicationController
  before_action :is_loggedin, only: %i(create)
    
  def create; end
end
