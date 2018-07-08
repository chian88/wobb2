class EmployersController < ApplicationController
	before_action :require_account, only: [:show]
	
	def show
		@employer = Employer.find(params[:id])
	end

	def new
		@employer = Employer.new
	end

	def create
		@employer = Employer.new(employer_params)

		if @employer.save
			flash[:success] = "Employer successfully created."
			redirect_to login_path
		else
			flash[:warning] = "Something wrong."
			render :new
		end
	end

	private

	def employer_params
		params.require(:employer).permit!
	end
end