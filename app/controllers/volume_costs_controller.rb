class VolumeCostsController < ApplicationController
  before_action :authorize

  def new
  end

  def index
    @category = Category.find(params[:category_id])
    @volume_costs = @category.volume_costs
    
    respond_to do |format|
      format.html
      format.json { render json: @volume_costs, :layout => false }
    end
  end

  private

  def volume_cost_params
    params.require(:volume_cost).permit(:volume, :cost, :category_id)
  end

end
