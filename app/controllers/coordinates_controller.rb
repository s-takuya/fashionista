class CoordinatesController < ApplicationController
  def index
    @search = Coordinate.ransack(params[:q])
    @coordinates = @search.result(distinct: true).order(id: :desc)
  end

  def show
    @coordinate = Coordinate.find(params[:id])
  end

  def new
    @coordinate = Coordinate.new
    @coordinate.photos.build
  end

  def create
    @coordinate = Coordinate.new(coordinate_params)
    if @coordinate.save
      redirect_to @coordinate
    else
      render :new
    end
  end

  private

  def coordinate_params
    params.require(:coordinate).permit(:person_name, :dress_season, :occupation, photos_attributes: :image)
  end
end
