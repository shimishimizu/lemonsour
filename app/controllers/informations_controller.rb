class InformationsController < ApplicationController
  def index
  	@informations = Information.page(params[:page]).per(5)
  end

  def show
  	@information = Information.find(params[:id])
  end
end
