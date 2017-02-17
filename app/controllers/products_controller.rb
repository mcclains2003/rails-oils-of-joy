class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def new
    @product = Product.new

    3.times do
      @product.volume_costs.build
    end
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
    if params[:category_id]
      @products = Product.joins(:category).where('category_id' => params[:category_id].to_s)
    else
      @products = Product.all
    end
  end

  def destroy
    @product.destroy

    redirect_to root_path
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :category_id, :oil_ids => [], :volume_costs_attributes => [:volume, :cost])
  end

  def set_product
    @product = Product.find(params[:id])
  end

end
