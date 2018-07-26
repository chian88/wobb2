class UsersController < ApplicationController
	before_action :require_user, only: [:show, :update, :edit]

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			flash[:success] = "User successfully created."
			redirect_to login_path
		else
			flash[:warning] = "Something wrong"
			render :new
		end
	end

	def show
		@user = current_user
		@jobs_applied = current_user.applications
		@applications_accepted = current_user.applications.where(status: 'accepted')
		@applications_rejected = current_user.applications.where(status: 'rejected')
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		
		if @user.update(user_params)
			flash[:success] = "User successfully updated."
			redirect_to dashboard_path
		else
			render :edit
		end
	end

	private

	def user_params
		params.require(:user).permit!
	end

end