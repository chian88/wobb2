class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :current_employer, :logged_in_user

  def logged_in_user
    current_user || current_employer
  end

  def current_user
  	User.find(session[:user_id]) if session[:user_id]
  end

  def current_employer
    Employer.find(session[:employer_id]) if session[:employer_id]
  end

  def require_user
  	unless current_user
  		flash[:warning] = "You must be logged in as user for this action."
  		redirect_to login_path
  	end
  end

  def require_employer
    unless current_employer
      flash[:warning] = "You must be logged in as employer for this action."
      redirect_to login_path
    end
  end

  def require_account
    unless current_employer || current_user
      flash[:warning] = "You must have an account for this action."
      redirect_to login_path
    end
  end
end
