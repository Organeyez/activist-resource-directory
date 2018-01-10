class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_categories 

  protected 

  def set_categories
    @categories = Category.order(:title) 
  end

 	def after_sign_in_path_for(resource)
  		user_path(@user)
	end
end
