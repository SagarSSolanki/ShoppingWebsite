class ProductsController < ApplicationController
  before_action :is_loggedin, only: %i(edit update destroy)
  before_action :is_admin, only: %i(edit update destroy)
  before_action :find_product, only: %i(show edit update destroy)
  
  def index
    @products = Product.all
    @user = current_user
  end

  def show
    redirect_to products_path, notice: "Product Not Found!" if @product.blank?
    @user = current_user
  end

  def new 
    @product = Product.new
  end

  def create 
    @product = Product.new(product_params)

    if @product.save
      redirect_to products_path, notice: "Successfully Added Product"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    redirect_to products_path, notice: "Product Not Found!" if @product.blank?
  end

  def update
    if @product.update(product_params)
      redirect_to product_path(id: @product.id), notice: "Successfully Updated Product"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy

    redirect_to products_path, notice: "1 Product Deleted"
  end

  private

  def product_params
<<<<<<< HEAD
    params.require(:product).permit(:name, :price, :stock, :category_id, :image)
  end

  def is_admin
    redirect_to root_path, notice: "You dont have admin rights" if current_user.email != "sagar@gmail.com"
=======
    params.require(:product).permit(:name, :price, :stock, :category_id)
  end

  def is_admin
    redirect_to root_path, notice: "You don't have admin rights" if current_user.email != "sagar@gmail.com"
>>>>>>> 8432aaba1079322be43561db543662d4a4c97b6d
  end

  def find_product
    @product = Product.find_by(id: params[:id])
  end
end
