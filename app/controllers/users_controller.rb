class UsersController < ApplicationController
  require 'csv'

	def index
   @users = User.all 
   @subscribed_users = User.where(subscribe: true)
	end 

	def show
		@user = User.find(params[:id])
		@resources = @user.posted_resources.order(:title)
	end


  def email_subscribers
    @subscribed_users = User.where(subscribe: true)
    respond_to do |format|
      format.csv do 
        headers['Content-Type'] = 'text/csv'
      end
    end
  end

end 

