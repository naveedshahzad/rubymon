class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :login_required
  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
  def login_required
    redirect_to login_url if !logged_in?
  end

  def logged_in?
    !session[:user_id].blank?
  end
  helper_method :logged_in?
end
