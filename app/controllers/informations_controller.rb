class InformationsController < ApplicationController
 	before_action :authenticate_user!

  def index
  	@informations = Information.page(params[:page]).per(5)
  end

  def show
  	@information = Information.find(params[:id])
  end
end
