class ResourceTagsController < ApplicationController

	def destroy
    @resource_tag = ResourceTag.find_by(tag_id: params[:id], resource_id: params[:resource_id])
    @resource_tag.destroy

    redirect_to resource_path(params[:resource_id])
	end

end