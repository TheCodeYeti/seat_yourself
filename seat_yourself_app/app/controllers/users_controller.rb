class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])

  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to restaurants_url
    else
      render :new
    end
  end

  # def delete TO BE ADDED LATER
  #   @user = User.find(params[:id])
  #   @user.destroy
  #   # redirect_to SOMETHING NEEDS TO GO HERE
  #
  # end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      redirect_to user_url(@user)
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email)
  end
end
