class AddressesController < ApplicationController
  def index 
    @address = Address.new 
  end

  def edit
    @address = Address.find_by(id: params[:id])
    redirect_to root_path, notice: "Address Not Found!" if @address.blank?
  end

  def update
    @address = Address.find_by(id: params[:id])

    if @address.update(address_params)
      redirect_to root_path, notice: "Successfully Updated Address"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def create
    @user = User.find_by(id: session[:user_id])
    @address = @user.addresses.new(address_params)

    if @address.save
      redirect_to root_path(@user), notice: "Successfully Added Address"
    else
      render :index, status: :unprocessable_entity
    end
    
  end
  
  def destroy
    @address = Address.find_by(id: params[:id])
    @address.destroy 

    redirect_to root_path, notice: "1 Address Deleted!"
  end

  private

  def address_params
    params.require(:address).permit(:area, :city, :state, :pincode)
  end
end
