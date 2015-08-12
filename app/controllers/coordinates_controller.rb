class CoordinatesController < ApplicationController
  def index
    @search = Coordinate.ransack(params[:q])
    @coordinates = @search.result(distinct: true)
  end

  def show
    @coordinate = Coordinate.find(params[:id])
  end
end
