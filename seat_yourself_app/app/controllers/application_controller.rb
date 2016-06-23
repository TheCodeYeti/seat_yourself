class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # This will be required when people sign in
  #before_action :require_login

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user

  # This will be required when people sign in
  # def require_login
  #   if current_user == nil
  #     flash[:alert] = "You must be logged in!"
  #     redirect_to new_session_path # redirect to login page
  #   end
  # end

end
