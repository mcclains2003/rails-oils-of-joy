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
    @oil_benefits = @oil.benefits
    @benefit = Benefit.new

    respond_to do |format|
      format.html { render :show }
      format.json { render json: @oil }
    end
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

    respond_to do |format|
      format.html { render :index }
      format.json { render json: @oils }
    end
  end

  def destroy
    @oil.destroy

    respond_to do |f|
      f.json { render :json => @oil }
      f.html { redirect_to oils_path }
    end
  end

  private

  def oil_params
    params.require(:oil).permit(:name, :description, :benefit_ids => [])
  end

  def set_oil
    @oil = Oil.find(params[:id])
  end

end
