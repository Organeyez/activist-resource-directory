class TagsController < ApplicationController


	def create
		@resource = Resource.find(params[:tag][:resource_id])
		@tag = Tag.find_or_create_by(name: params[:tag][:name])
		if @resource.resource_tags.length < 10
			@resource_tag = @resource.resource_tags.new(tag: @tag)
			if @resource_tag.save
				redirect_to resource_path(@resource)
			else
				@errors = ["This tag is already associated with your resource"]
				redirect_to resource_path(@resource), notice: "This tag is already associated with your resource"
			end
		else
			@errors = ["You cannot add more than 10 tags to this resource"]
			redirect_to resource_path(@resource), notice: "You cannot add more than 10 tags to this resource"
		end
				
	end

end
