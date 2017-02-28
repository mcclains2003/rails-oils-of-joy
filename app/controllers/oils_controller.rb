class OilsController < ApplicationController
  before_action :set_oil, only: [:show, :edit, :update, :destroy]
  before_action :authorize, except: [:show, :index]

  def new
    @oil = Oil.new
  end

  def create
    @oil = Oil.new(oil_params)

    if @oil.save
      redirect_to oil_path(@oil)
    else
      render :new
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
    @oil.delete

    redirect_to oils_path
  end

  private

  def oil_params
    params.require(:oil).permit(:name, :description)
  end

  def set_oil
    @oil = Oil.find(params[:id])
  end

end
