class RestaurantsController < ApplicationController

  def index

    @restaurants = Restaurant.all

  end

  def show
    @restaurant = Restaurant.find_by(id: params[:id])
  end

  def owner_list

    @restaurants = []

    if current_user
      @restaurants = Restaurant.where(user_id: current_user.id)
      @reservations = Reservation.where(user_id: current_user.id)
    end

  end

  def new
    @restaurant = Restaurant.new()

  end

  def edit
    @restaurant = Restaurant.find_by(id: params[:id])
  end

    def create
      @restaurant = Restaurant.new(restaurant_params())
      @restaurant.owner = current_user
      if @restaurant.save
        redirect_to restaurants_url
      else
        render  :new
      end

    end

    def update
      @restaurant = Restaurant.find(id: params[:id])

      if @restaurant.update_attributes(restaurant_params())
        redirect_to restaurants_url(@restaurant)
      else
        render  :edit
      end

    end

    def destroy
      @restaurant = Restaurant.find(id: params[:id])
      @restaurant.destroy
      redirect_to restaurants_url
    end

    private

    def restaurant_params
      params.require(:restaurant).permit(:name, :capacity, :address, :description, :open_time, :close_time, :user_id)
    end


end
