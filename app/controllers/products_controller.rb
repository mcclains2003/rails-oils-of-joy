class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to product_path(@product)
    else
      redirect_to new_product_path
    end
  end

  def show
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to product_path(@product)
    else
      redirect_to edit_product_path(@product)
    end
  end

  def index
    @products = Product.all
  end

  def destroy
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :category_id, oil_ids: [], variant_ids: [])
  end

  def set_product
    @product = Product.find(params[:id])
  end

end
