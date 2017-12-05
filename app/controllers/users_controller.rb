class UsersController < ApplicationController

	def index
   @users = User.all 
   @subscribed_users = User.where(subscribe: true)
	end 

	def show
		@user = User.find(params[:id])
		@resources = @user.posted_resources.order(:title)
	end


end