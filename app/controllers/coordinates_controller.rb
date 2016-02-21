class CoordinatesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @coordinates = Coordinate.search(params[:owner_id], params[:dress_season])
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
      if Owner.where(name: params[:coordinate][:owner][:name]).present?
        owner = Owner.where(name: params[:coordinate][:owner][:name]).first
        @coordinate.update(owner_id: owner.id)
      else
        new_owner = Owner.create(name: params[:coordinate][:owner][:name], occupation: params[:coordinate][:owner][:occupation])
        @coordinate.update(owner_id: new_owner.id)
      end
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
    params.require(:coordinate).permit(:dress_season, photos_attributes: :image)
  end
end
