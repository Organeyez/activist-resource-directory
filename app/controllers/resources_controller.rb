class ResourcesController < ApplicationController
	def index
		@resources = Resource.all 
	end

	def show
	end

	def new
		@resource = Resource.new 
	end

	def create
	end

	def edit
	end

	def update
	end

	def delete
	end
end
