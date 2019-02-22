class InformationsController < ApplicationController
 	before_action :authenticate_user!

  def index
  	@informations = Information.page(params[:page]).order('updated_at desc').per(5)
  end

  def show
  	@information = Information.find(params[:id])
  end
end
