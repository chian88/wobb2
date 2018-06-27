class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
  	User.find(session[:user_id]) if session[:user_id]
  end

  def require_user
  	unless current_user
  		flash[:warning] = "You must be logged in for this action."
  		redirect_to login_path

  	end
  end
end
