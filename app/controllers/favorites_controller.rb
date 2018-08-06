class FavoritesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @favorited_resources = @user.favorited_resources.order(:title)
    respond_to do |f|
       f.html { render :index}
       f.json { render json: @favorited_resources.to_json}
       f.js
    end
  end

  def create
    @favorite = current_user.favorites.find_or_create_by(resource_id: params[:resource_id], fan_id: params[:fan_id])
    redirect_to user_favorites_path
  end

  def destroy
    @favorite = current_user.favorites.find_by(resource_id: params[:resource_id], fan_id: params[:fan_id])
    @favorite.destroy
    redirect_to user_favorites_path
  end

  private
  def collection_params
    params.require(:favorite).permit(:resource_id, :fan_id)
  end
end
