class OwnersController < ApplicationController
  def index
    @owners = Owner.all.shuffle
  end

  def show
    @owner = Owner.find(params[:id])
    @coordinates = @owner.coordinates.includes(:photos).shuffle
  end
end
