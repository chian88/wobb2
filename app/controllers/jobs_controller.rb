class JobsController < ApplicationController
	before_action :require_account, only: [:index, :show, :filter]
	before_action :require_employer, only: [:new, :create]
	before_action :require_user, only: [:favourite]

	def create
		@job = Job.new(job_params.merge(employer: current_employer))
		if @job.save
			flash[:success] = "You have successfully save a job."
			redirect_to jobs_path
		else
			flash[:warning] = "Something went wrong."
			render :new
		end
	end
	
	def index
		@jobs = Job.all
	end

	def show
		@job = Job.find(params[:id])
	end

	def filter
		job_filter_data = extract_job_data
		@jobs = Job.where(job_filter_data)
		render :index
	end

	private

	def job_params
		params.require(:job).permit!
	end

	def extract_job_data
		params[:job].permit!.reject! { |head, val| val.blank? }
	end
end