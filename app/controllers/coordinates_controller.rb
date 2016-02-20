class CoordinatesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @search = Coordinate.ransack(params[:q])
    @coordinates = @search.result(distinct: true).order(id: :desc)
  end

  def show
    @coordinate = Coordinate.find(params[:id])
    @associated_coordinates = Coordinate.where(person_name: @coordinate.person_name)
  end

  def new
    @coordinate = Coordinate.new
    @coordinate.photos.build
  end

  def show_more
    @coordinates = Coordinate.where(person_name: params[:person_name])
  end

  def create
    @coordinate = Coordinate.new(coordinate_params)
    if @coordinate.save
      redirect_to @coordinate
    else
      render :new
    end
  end

  def destroy
    @coordinate = Coordinate.find(params[:id])
    @coordinate.delete
    redirect_to @coordinate
  end

  private

  def coordinate_params
    params.require(:coordinate).permit(:person_name, :dress_season, :occupation, photos_attributes: :image)
  end
end
