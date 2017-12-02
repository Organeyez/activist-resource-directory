class ControlPanelController < ApplicationController

  http_basic_authenticate_with name: ENV['ADMIN_USERNAME'], password: ENV['ADMIN_PASSWORD']

  def index
  end

  def create

  end

  def destroy
 
  end

end