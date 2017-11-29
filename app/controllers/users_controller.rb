class UsersController < ApplicationController

	def index
	end 

	def show
		@user = User.find(params[:id])
		@resources = @user.posted_resources
		respond_to do |f|
	       f.html { render :show}
	       f.json { render json: @resources.to_json}
	       f.js
	    end
	end


end