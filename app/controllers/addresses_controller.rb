class AddressesController < ApplicationController
  def index 
    @address = Address.new 
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])

    if @address.update(address_params)
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def create
    @user = User.find_by(id: session[:user_id])
    @address = @user.addresses.create(address_params)
    redirect_to root_path(@user)
  end
  
  def destroy
    @address = Address.find_by(id: params[:id])
    @address.destroy 

    redirect_to root_path
  end

  private

  def address_params
    params.require(:address).permit(:area, :city, :state, :pincode)
  end
end
