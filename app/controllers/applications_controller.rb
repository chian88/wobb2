class ApplicationsController < ApplicationController
	before_action :require_user, only: [:create]
	before_action :require_employer, only: [:index]

	def index
		job = Job.find(params[:job_id])
		@job_applicants = job.users
	end

	def create
		job_application = Application.new(user: current_user, job_id: params[:job_id])

		if job_application.save
			flash[:success] = "Job applied"
			redirect_to job_path(params[:job_id])
		else
			flash[:warning] = "Job application error"
			redirect_to job_path(params[:job_id])
		end
	end
end