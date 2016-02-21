class OwnersController < ApplicationController
  def index
    @owners = Owner.recent
  end

  def show
    @owner = Owner.find(params[:id])
    @coordinates = @owner.coordinates.includes(:photos)
  end
end
