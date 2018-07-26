require 'rails_helper'

describe ApplicationsController do
	describe "GET index" do
			before do
				session[:employer_id] = Fabricate(:employer).id
			end
		it 'get applications with status of pending' do
			job1 = Fabricate(:job)
			job2 = Fabricate(:job)
			application1 = Fabricate(:application, job: job1)
			application2 = Fabricate(:application, job: job1)
			application3 = Fabricate(:application, job: job2)
			get :index, params: { job_id: job1.id }
			expect(assigns(:applications)).to match_array([application1, application2])
		end
	end

	describe "POST create" do
		context 'with signed in user' do
			let(:alice) { Fabricate(:user) }

			before do
				session[:user_id] = alice.id
			end

			it 'creates a new job application' do
				job = Fabricate(:job)
				post :create, params: { job_id: job.id }
				expect(Application.count).to eq(1)
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

	describe 'PUT hire' do
		context 'with signed in employer' do

			let(:bob) { Fabricate(:employer) }
			let(:application) { Fabricate(:application) }
			before do 
				session[:employer_id] = bob.id
			end

			after do
				ActionMailer::Base.deliveries.clear
			end

			it 'updates job_application status from nil to accepted' do
				put :hire, params: { id: application.id }
				expect(application.reload.status).to eq('accepted')
			end

			it 'send email to applicant' do
				put :hire, params: { id: application.id }
				expect(ActionMailer::Base.deliveries.last.to).to eq([application.user.email])
			end

			it 'redirect to job application page' do
				put :hire, params: { id: application.id }
				expect(response).to redirect_to job_applications_path(application.job)
			end
		end
	end

	describe 'PUT reject' do
		context 'with signed in employer' do
			let(:bob) { Fabricate(:employer) }
			let(:application) { Fabricate(:application) }
			before do 
				session[:employer_id] = bob.id
			end

			it 'updates job_application status from nil to rejected' do
				put :reject, params: { id: application.id }
				expect(application.reload.status).to eq('rejected')
			end

			it 'send email to applicant' do
				put :reject, params: { id: application.id }
				expect(ActionMailer::Base.deliveries.last.to).to eq([application.user.email])
			end

			it 'redirect to job application page' do
				put :reject, params: { id: application.id }
				expect(response).to redirect_to job_applications_path(application.job)
			end
		end
	end
end