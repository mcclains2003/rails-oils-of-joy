class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :authorize, except: [:show, :index]

  def new
    @product = Product.new(category_id: params[:category_id])
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to product_path(@product)
    else
      render :new
    end
  end

  def show
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @product }
    end
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
      @category = Category.find(params[:category_id])
      @products = @category.products.sort_alpha
    else
      @products = Product.sort_alpha
    end
    
    respond_to do |format|
      format.html { render :index }
      format.json { render json: @products }
    end
  end

  def destroy
    @product.destroy

    redirect_to root_path
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :category_id, :oil_ids => [], :volume_cost_ids => [])
  end

  def set_product
    @product = Product.find(params[:id])
  end

end
