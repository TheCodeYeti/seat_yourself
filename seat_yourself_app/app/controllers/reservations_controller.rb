class ReservationsController < ApplicationController
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reservation = @restaurant.reservations.build
  end

  def create
    @reservation = Reservation.new(reservation_params)

    if @reservation.save
      redirect_to restaurant_reservations_url
    else
      render :new
    end
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def index
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reservations = Reservation.where(restaurant: @restaurant)
  end

  def update
    @reservation = Reservation.find(params[:id])

    if @reservation = Reservation.update_attributes(reservation_params)
      redirect_to restaurant_reservations_url
    else
      render :edit
    end

  end

  def edit
    @reservation = Reservation.find(params[:id])
  end

  # We will do this later
  #def delete
  #end

  private

  def reservation_params
    params.require(:reservation).permit(:reservation_date, :reservation_time, :party_size, :notes) #Do we need restaurant or user id here?
  end
end
