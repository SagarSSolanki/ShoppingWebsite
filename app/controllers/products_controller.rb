class ProductsController < ApplicationController
  before_action :is_loggedin
  
  def index
    @products = Product.all
    @user = current_user
  end

  def show
    @product = Product.find_by(id: params[:id])
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
    @product = Product.find_by(id: params[:id])
    redirect_to products_path, notice: "Product Not Found!" if @product.blank?
  end

  def update
    @product = Product.find_by(id: params[:id])

    if @product.update(product_params)
      redirect_to product_path(id: @product.id), notice: "Successfully Updated Product"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy

    redirect_to products_path, notice: "1 Product Deleted"
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :stock, :category_id)
  end
end
