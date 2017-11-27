class ResourcesController < ApplicationController
	def index
		@resources = Resource.all 
	end

	def show
		@resource = Resource.find(params[:id])
	end

	def new
		@resource = Resource.new 
		@categories = Category.all
	end

	def create
		@resource = current_user.posted_resources.new(resource_params)
		if @resource.save
			redirect_to resource_path(@resource), notice: "Your Resource was successfully created"
		else
			@errors = @resource.errors.full_messages
			render :new, status: 422
		end

	end

	def edit
	end

	def update
	end

	def delete
	end

	private
	def resource_params
		params.require(:resource).permit(:title, :description, :url, :category_id)
	end
end
