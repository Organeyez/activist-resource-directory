class ResourcesController < ApplicationController
	def index
		@resources = Resource.all 
	end

	def show
		@resource = Resource.find(params[:id])
		@tag = Tag.new 
		@review = Review.new 
	end

	def new
		@resource = Resource.new 
		@categories = Category.order(:title)
	end

	def create
		@resource = current_user.posted_resources.new(resource_params)
		@categories = Category.order(:title) 
		if @resource.save
			redirect_to resource_path(@resource), notice: "Your Resource was successfully created. Please double-check that your link works correctly"
		else
			@errors = @resource.errors.full_messages
			render :new, status: 422
		end
	end

	def edit
		@resource = Resource.find(params[:id])
		@categories = Category.all
	end

	def update
		@categories = Category.all
		@resource = Resource.find(params[:id])
		@resource.update_attributes(resource_params)

		if @resource.save
			redirect_to resource_path(@resource), notice: "Resource was successfully updated"
		else
			@errors = @resource.errors.full_messages
			render :edit
		end
	end

	def destroy
		@resource = Resource.find(params[:id])
		@resource.destroy
		redirect_to user_path(current_user), notice: "Resource was successfully destroyed" 
	end

	private
	def resource_params
		params.require(:resource).permit(:title, :description, :url, :category_id)
	end
end
