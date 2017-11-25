class CategoriesController < ApplicationController
	before_action :authenticate_user! 

	def index
		@categories = Category.order(:title)
		if user_signed_in?
			redirect_to resources_path 
		else
			redirect_to new_user_session_path 
		end
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
