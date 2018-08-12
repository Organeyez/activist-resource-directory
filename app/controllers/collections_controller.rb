class CollectionsController < ApplicationController
  def index
    @collections = Collection.where(owner_id: params[:user_id]).order(:name)
    @user = User.find(params[:user_id])
  end

  def show
    @collection = Collection.find(params[:id])
    @user = @collection.owner
    @collection_resources = CollectionResource.where(collection_id: @collection.id)
    @collection_resource ||=CollectionResource.new
    @resources = @collection.resources
    respond_to do |f|
       f.html { render :show}
       f.json { render json: @resources.to_json}
       f.js
    end
  end

  def new
    @collection = Collection.new
  end

  def create
    @collection = Collection.new(collection_params)

    if @collection.save
      redirect_to user_collections_path(current_user), notice: "Your collection was successfully created"
    else
      @errors = @collection.errors.full_messages
      render :new
    end
  end

  def edit
    @collection = Collection.find(params[:id])
    respond_to do |f|
       f.html { render :edit}
       f.json { render json: @collection.to_json}
       f.js
    end
  end

  def update
    @collection = Collection.find(params[:id])
    @collection.update_attributes(collection_params)
    if @collection.save
      redirect_to user_collections_path(current_user), notice: "Collection was successfully updated"
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
