class FavouritesController < ApplicationController
	before_action :require_user

	def create
		job = Job.find(params[:job_id])
		favourite = Favourite.new(job: job, user: current_user)
		if favourite.save
			flash[:success] = "Successfully saved to user's favourite"
			redirect_to job_path(job)
		else
			flash[:warning] = "You can't save this job again"
			redirect_to job_path(job)
		end
	end

	def index
	end
end