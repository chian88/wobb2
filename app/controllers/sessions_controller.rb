class SessionsController < ApplicationController
	def new
		if current_user
			flash[:primary] = "You are logged in already." 
			redirect_to jobs_path
		end
	end

	def create
		if params[:employer]
			employer_login
			return
		end

		user_login
	end

	def destroy
		session[:user_id] = nil
		session[:employer_id] = nil
		flash[:success] = "You've logged out"
		redirect_to root_path
	end

	private

	def employer_login
		session[:user_id] = nil
		employer = Employer.find_by(email: params[:email])

		if employer && employer.authenticate(params[:password])
			session[:employer_id] = employer.id
			flash[:success] = "You are successfully logged in."
			redirect_to employer_path(employer)
		else
			flash[:warning] = "You failed to log in"
			redirect_to login_path
		end
	end

	def user_login
		session[:employer_id] = nil
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
end