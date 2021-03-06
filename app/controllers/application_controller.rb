class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  def logged_in?
    !!current_user
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  helper_method :current_user

  def authorize
    redirect_to root_path, alert: "You do not have access to this page, please login as an admin or contact the administrator" unless allowed?
  end

  def allowed?
    current_user && current_user.admin?
  end

  helper_method :allowed?
    
end
