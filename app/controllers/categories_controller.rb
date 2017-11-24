class CategoriesController < ApplicationController
	def index
		@categories = Category.order(:title)
	end 

	def show
		@category = Category.find(params[:id])
	end

#for admin use only 
	def new
	end

	def create
	end

	def edit
	end

	def update
	end

end
