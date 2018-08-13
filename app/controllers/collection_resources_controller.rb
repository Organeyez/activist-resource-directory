class CollectionResourcesController < ApplicationController
  def create
    @collection = current_user.collections.find(params[:collection_resource][:collection_id])
    @collection_resource = @collection.collection_resources.create(collection_resource_params)
    if @collection_resource.save
      flash[:success] = 'Resource was successfully added to this collection'
    else
      flash[:alert] = 'Resource was NOT added to this collection'
      @errors = @collection_resource.errors.full_messages
    end

    redirect_to user_collection_path(id: @collection.id, user_id: current_user.id)
  end

  def destroy
    @collection_resource = CollectionResource.find(params[:id])
    @collection = Collection.find(@collection_resource.collection_id)
    @collection_resource.destroy
    redirect_to user_collection_path(id: @collection.id, user_id: current_user.id)

  end

  private

  def collection_resource_params
    params.require(:collection_resource).permit(:collection_id, :resource_id)
  end
end
