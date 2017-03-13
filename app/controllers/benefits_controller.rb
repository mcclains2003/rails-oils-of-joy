class BenefitsController < ApplicationController
  before_action :set_benefit, only: [:show, :edit, :update, :destroy]
  before_action :authorize, except: [:show, :index]

  def new
    @benefit = Benefit.new
  end

  def create
    @benefit = Benefit.new(benefit_params)

    if @benefit.save
      redirect_to benefit_path(@benefit)
    else
      render :new
    end
  end

  def index
    @benefits = Benefits.all
  end

  def show
  end

  def edit
  end

  def update
    if @benefit.update(benefit_params)
      redirect_to benefit_path(@benefit)
    else
      redirect_to edit_benefit_path(@benefit)
    end
  end

  def destroy
    @benefit.delete

    redirect_to benefits_path
  end

  private

  def benefit_params
    params.require(:benefit).permit(:description)
  end

  def set_benefit
    @benefit = Benefit.find(params[:id])
  end

end