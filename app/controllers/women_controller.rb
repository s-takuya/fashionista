class WomenController < ApplicationController
  def index
    @owners = Owner.woman.shuffle
  end

  def show
    @owner = Owner.find(params[:id])
    @coordinates = @owner.coordinates.includes(:photos).shuffle
  end
end
