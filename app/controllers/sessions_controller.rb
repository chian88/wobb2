class SessionsController < ApplicationController
	def new
		if current_user
			flash[:primary] = "You are logged in already." 
			redirect_to jobs_path
		end
	end

	def create
		user = User.find_by(email: params[:email])

		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			flash[:success] = "You are successfully logged in."
			redirect_to jobs_path
		else
			flash[:warning] = "You failed to log in"
			redirect_to login_path
		end
	end

	def destroy
		session[:user_id] = nil
		flash[:success] = "You've logged out"
		redirect_to root_path
	end
end