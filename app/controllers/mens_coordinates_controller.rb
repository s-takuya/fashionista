class MensCoordinatesController < ApplicationController
  def show
    @coordinate = Coordinate.find(params[:id])
  end
end
