class JobsController < ApplicationController
	before_action :require_user
	
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

	def extract_job_data
		params[:job].permit!.reject! { |head, val| val.blank? }
	end
end