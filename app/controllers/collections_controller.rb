class CollectionsController < ApplicationController

  def index
    @collections = current_user.collections
  end

  def show
    @collection = Collection.find(params[:id])
    @collection_resource = CollectionResource.new 
    @resources = @collection.resources 
  end

  def new
    @collection = Collection.new 
  end

  def create
    @collection = Collection.new(collection_params)

    if @collection.save
      redirect_to user_collections_path(current_user), notice: "Your Collection was successfully created"
    else
      @errors = @collection.errors.full_messages 
      render :new 
    end 
  end

  def edit
    @collection = Collection.find(params[:id])
  end

  def update
    @collection = Collection.find(params[:id])
    if @collection.save
      redirect_to user_collection_path(@collection), notice: "Collection was successfully updated"
    else
      @errors = @collection.errors.full_messages
      render :edit
    end
  end

  def destroy
    @collection = Collection.find(params[:id])
    @collection.destroy
    redirect_to user_collections_path(current_user), notice: "collection was successfully destroyed" 
  end

  private
  def collection_params
    params.require(:collection).permit(:name, :owner_id)
  end

end