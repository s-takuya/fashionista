class CoordinatesController < ApplicationController
  def index
    @coordinates = Coordinate.all
  end

  def show
    @coordinate = Coordinate.find(params[:id])
  end
end
