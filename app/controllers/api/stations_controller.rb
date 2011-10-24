class Api::StationsController < ApplicationController
  def index
    @stations = StationDecorator.decorate(Station.all)
  end

  def show
    redirect_to :api_stations unless params[:id]
    @station = StationDecorator.find(params[:id])
  end

  def next
    redirect_to :api_stations unless params[:id]
    #@services = ServiceDecorator.decorate(Station.next(params[:id]))
    @services = Station.next(params[:id])
  end
end