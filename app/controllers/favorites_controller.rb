class FavoritesController < ApplicationController

  def index
     @favorited_resources = current_user.resources_favorited
  end

  def create
    @favorite = current_user.favorites.find_or_create_by(resource_id: params[:resource_id])
    redirect_to request.referer
  end

  def destroy
    @favorite = current_user.favorites.find_by(resource_id: params[:resource_id])
    @favorite.destroy
    redirect_to request.referer
  end

end