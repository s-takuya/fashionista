class MensController < ApplicationController
  def index
    @owners = Owner.man.shuffle
  end

  def show
    @owner = Owner.find(params[:id])
    @coordinates = @owner.coordinates.includes(:photos).shuffle
  end
end
