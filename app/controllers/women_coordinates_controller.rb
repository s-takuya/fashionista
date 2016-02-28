class WomenCoordinatesController < ApplicationController
  def show
    @coordinate = Coordinate.find(params[:id])
  end
end
