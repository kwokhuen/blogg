class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # The methods created in the ApplicationController are available
  # to other controller, but not available in view by default.
  # The helper_method takes a method as an arguement,
  # and rails will make it accessible to view.
  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def require_user
    if !logged_in?
      flash[:danger] = "You must be logged in to perform that action."
      redirect_to login_path
    end
  end
end
