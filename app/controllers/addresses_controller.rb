class AddressesController < ApplicationController
  def create
    @user = User.find_by(id: session[:user_id])
    @address = @user.addresses.create(address_params)
    redirect_to root_path(@user)
  end
  
  private
  def address_params
    params.require(:address).permit(:area, :city, :state, :pincode)
  end
end
