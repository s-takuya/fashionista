class CoordinatesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @coordinates = Coordinate.search(params[:owner_id])
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
        if params[:coordinate][:owner][:man_flag].present?
          new_owner = Owner.create(name: params[:coordinate][:owner][:name], occupation: params[:coordinate][:owner][:occupation], man_flag: true)
        else
          new_owner = Owner.create(name: params[:coordinate][:owner][:name], occupation: params[:coordinate][:owner][:occupation], woman_flag: true)
        end
        @coordinate.update(owner_id: new_owner.id)
      end
      if @coordinate.owner.man_flag == true
        redirect_to mens_coordinate_path(id: @coordinate.id)
      else
        redirect_to women_coordinate_path(id: @coordinate.id)
      end
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
