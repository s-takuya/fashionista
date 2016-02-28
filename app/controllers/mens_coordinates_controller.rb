class MensCoordinatesController < ApplicationController
  def index
    @coordinates = Coordinate.search(params[:owner_id])
  end
  
  def show
    @coordinate = Coordinate.find(params[:id])
  end
end
