class Api::ServicesController < ApplicationController
  def index
    @services = ServiceDecorator.decorate(Service.all)
  end

  def show
    redirect_to :api_services unless params[:id]
    @service = ServiceDecorator.find(params[:id])
  end
end