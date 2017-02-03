class VariantsController < ApplicationController
  before_action :set_variant, only: [:show, :edit, :update, :destroy]

  def new
    @variant = Variant.new
  end

  def create
    @variant = Variant.new(variant_params)

    if @variant.save
      redirect_to variant_path(@variant)
    else
      redirect_to new_variant_path
    end
  end

  def show
  end

  def edit
  end

  def update
    if @variant.update(variant_params)
      redirect_to variant_path(@variant)
    else
      redirect_to edit_variant_path
    end
  end

  def index
    @variants = Variant.all
  end

  def destroy
  end

  private

  def set_variant
    @variant = Variant.find(params[:id])
  end

  def variant_params
    params.require(:variant).permit(:size)
  end

end
