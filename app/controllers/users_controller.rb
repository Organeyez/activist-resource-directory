class UsersController < ApplicationController

	def index
	end 

	def show
		@user = User.find(params[:id])
		@resources = @user.posted_resources
	end


end