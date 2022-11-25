class ServicesController < ApplicationController
  before_action :set_service, only: [:show, :edit, :update, :destroy]

  def index
    @services = policy_scope(Service)
    if params[:query].present?
      sql_query = <<~SQL
        services.genre @@ :query
        OR services.details @@ :query
        OR users.name @@ :query
        OR users.last_name @@ :query
      SQL
      @services = Service.joins(:user).where(sql_query, query: "%#{params[:query]}%")
    else
      @services = Service.all
    end
  end

  def user_index
    @services = Service.where(user_id: current_user)
  end

  def show
    authorize @service
    @marker = [{ lat: @service.latitude, lng: @service.longitude }]

    @booking = Booking.new
    unless @service.spotify_link.present?
      @service.spotify_link = "https://open.spotify.com/artist/4Z8W4fKeB5YxbusRsdQVPb?si=HtTDHexFQLSbh1NG93L3hw"
    end
  end

  def new
    @service = Service.new
  end

  def create
    @service = Service.new(service_params)
    @service.user = current_user
    if @service.save
      redirect_to service_path(@service)
    else
      render "new", status: :unprocessable_entity
    end
  end

  def edit
    authorize @service
  end

  def update
    authorize @service
    if @service.update(service_params)
      redirect_to service_path(@service)
    else
      render "edit", status: :unprocessable_entity
    end
  end

  def destroy
    authorize @service
    @service.destroy
    redirect_to services_path, status: :see_other
  end

  private

  def service_params
    params.require(:service).permit(:genre, :price, :details, :address, :spotify_link)
  end

  def set_service
    @service = Service.find(params[:id])
  end
end
