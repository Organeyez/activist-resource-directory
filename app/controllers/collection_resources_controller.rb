class CollectionResourcesController < ApplicationController
  def create
    @collection = current_user.collections.find(params[:collection_resource][:collection_id])
    @collection_resource = @collection.collection_resources.create(collection_resource_params)
    if @collection_resource.save
      redirect_to request.referer, notice: 'Resource was successfully added to this collection'
    else
      @errors = @collection_resource.errors.full_messages
      redirect_to request.referer, notice: 'Resource was NOT added to this collection'
    end
  end

  def destroy
    @collection_resource = CollectionResource.find_by(resource_id: params[:resource_id], collection_id: params[:collection_id])
    @collection_resource.destroy
    redirect_to request.referer
  end

  private

  def collection_resource_params
    params.require(:collection_resource).permit(:collection_id, :resource_id)
  end
end
