class VolumeCostsController < ApplicationController
  before_action :authorize

  def new
    render :layout => false
  end

end
