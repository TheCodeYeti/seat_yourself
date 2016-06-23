class ReservationsController < ApplicationController
  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)

    if @reservation.save
      redirect_to reservations_url
    else
      render :new
    end 
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def index
    @reservations = Reservation.all
  end

  def update
  end

  def edit
  end

  def delete
  end

  private

  def reservation_params
    params.require(:reservation).permit(:reservation_date, :time, :party_size, :notes) #Do we need restaurant or user id here?
  end
end
