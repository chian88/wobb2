class ApplicationsController < ApplicationController
	before_action :require_user, only: [:create]
	before_action :require_employer, only: [:index, :hire]

	def index
		@job = Job.find(params[:job_id])
		@applications = @job.applications.where(status: 'pending')
	end

	def create
		job_application = Application.new(user: current_user, job_id: params[:job_id])
		@job = job_application.job

		if job_application.save
			flash[:success] = "Job applied"
			AppMailer.apply_email(job_application).deliver
			redirect_to job_path(params[:job_id])
		else
			flash[:warning] = "Job application error"
			render 'jobs/show'
		end
	end

	def hire
		job_application = Application.find(params[:id])
		job_application.update(status: 'accepted')
		AppMailer.hire_email(job_application).deliver
		redirect_to job_applications_path(job_application.job)
	end

	def reject
		job_application = Application.find(params[:id])
		job_application.update(status: 'rejected')
		AppMailer.reject_email(job_application).deliver
		redirect_to job_applications_path(job_application.job)
	end
end