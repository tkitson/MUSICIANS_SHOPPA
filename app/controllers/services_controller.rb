class ServicesController < ApplicationController
  before_action :set_service, only: [:show, :edit, :update, :destroy]

  def index
    @services = Service.all
  end

  def show
  end

  def new
    @service = Service.new
  end

  def create
    @service = Service.new(service_params)
    if @service.save
      redirect_to service_path(@service)
    else
      render "new", status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @service.update(service_params)
      redirect_to service_path(@service)
    else
      render "edit", status: :unprocessable_entity
    end
  end

  def destroy
    @service.destroy
    redirect_to service_path, status: :see_other
  end

  private

  def service_params
    params.require(:service).permit(:genre, :price, :details, :photo)
  end

  def set_service
    @service = Service.find(params[:id])
  end
end
