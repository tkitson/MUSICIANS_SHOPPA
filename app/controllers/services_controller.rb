class ServicesController < ApplicationController
  def index
    @services = Service.all
  end

  def show
    @service = Service.find(service_params)
  end

  private

  def service_params
    params.require(:service).permit(:genre, :price, :details)
  end
end
