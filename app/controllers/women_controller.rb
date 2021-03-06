class WomenController < ApplicationController
  def index
    @owners = Owner.includes(:coordinates).woman.shuffle
  end

  def show
    @owner = Owner.find(params[:id])
    @coordinates = @owner.coordinates.includes(:photos).order(:id)
  end
end
