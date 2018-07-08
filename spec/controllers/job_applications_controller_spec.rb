require 'rails_helper'

describe JobApplicationsController do
	describe "POST create" do
		context 'with signed in user' do
			let(:alice) { Fabricate(:user) }

			before do
				session[:user_id] = alice.id
			end

			it 'creates a new job application' do
				job = Fabricate(:job)
				post :create, params: { job_id: job.id }
				expect(JobApplication.count).to eq(1)
			end

			it 'create a flash success message' do
				job = Fabricate(:job)
				post :create, params: { job_id: job.id }
				expect(flash[:success]).to be_present
			end
		end

		context 'without signed in user' do
			it 'redirect to login path' do
				job = Fabricate(:job)
				post :create, params: { job_id: job.id }
				expect(response).to redirect_to login_path
			end
		end
	end
end