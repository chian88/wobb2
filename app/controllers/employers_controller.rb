class EmployersController < ApplicationController
	before_action :require_user, only: [:show]
	
	def show
		@employer = Employer.find(params[:id])
	end

	def new
		@employer = Employer.new
	end
end