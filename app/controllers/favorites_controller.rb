class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def index
    @coordinates = current_user.votes.up.for_type(Coordinate).order('created_at desc').votables
  end

  def create
    @coordinate = Coordinate.find(params[:coordinate_id])
    @coordinate.liked_by current_user
  end

  def remove
    @coordinate = Coordinate.find(params[:coordinate_id])
    @coordinate.disliked_by current_user
  end
end
