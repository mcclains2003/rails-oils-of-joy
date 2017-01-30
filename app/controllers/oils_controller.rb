class OilsController < ApplicationController
  before_action :set_oil, only: [:show, :edit, :update, :destroy]

  def new
    @oil = Oil.new
  end

  def create
    @oil = Oil.new(oil_params)

    if @oil.save
      redirect_to oil_path(@oil)
    else
      redirect_to new_oil_path
    end
  end

  def show
  end

  def edit
  end

  def update
    if @oil.update(oil_params)
      redirect_to oil_path(@oil)
    else
      redirect_to edit_oil_path(@oil)
    end
  end

  def index
    @oils = Oil.all
  end

  def destroy
  end

  private

  def oil_params
    params.require(:oils).permit(:name, :description)
  end

  def set_oil
    @oil = Oil.find(param[:id])
  end

end
