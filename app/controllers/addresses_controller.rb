class AddressesController < ApplicationController
  before_action :is_loggedin
  before_action :address_check, only: %i(edit update destroy)

  def index 
    @address = Address.new 
  end

  def edit; end 

  def update

    if @address.update(address_params)
      redirect_to root_path, notice: "Successfully Updated Address"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def create
    @address = current_user.addresses.new(address_params)

    if @address.save
      redirect_to root_path, notice: "Successfully Added Address"
    else
      render :index, status: :unprocessable_entity
    end
  end
  
  def destroy
    @address.destroy 

    redirect_to root_path, notice: "1 Address Deleted!"
  end

  private

  def address_params
    params.require(:address).permit(:area, :city, :state, :pincode)
  end

  def address_check
    @address = current_user.addresses.find_by(id: params[:id])
    redirect_to root_path, notice: "Unauthorized Access!" if @address.blank?
  end
end
