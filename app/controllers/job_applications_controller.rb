class JobApplicationsController < ApplicationController
	before_action :require_user

	def create
		job_application = JobApplication.new(user: current_user, job_id: params[:job_id])

		if job_application.save
			flash[:success] = "Job applied"
			redirect_to job_path(params[:job_id])
		else
			flash[:warning] = "Job application error"
			redirect_to job_path(params[:job_id])
		end
	end
end