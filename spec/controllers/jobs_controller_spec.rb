require 'rails_helper'

describe JobsController do
	describe 'GET index' do
		context "with signed in user" do
			it 'sets @jobs' do
				session[:user_id] = Fabricate(:user).id
				job = Fabricate(:job)

				get :index
				expect(assigns(:jobs)).to eq([job])
			end
		end

		context "without signed in user" do
			it 'redirect to login path' do
				job = Fabricate(:job)

				get :index
				expect(response).to redirect_to login_path
			end
		end
	end

	describe 'POST create' do
		context 'with valid input' do
			let(:boss) { Fabricate(:employer) }
			before do 
				session[:employer_id] = boss.id
				post :create, params: { job: Fabricate.attributes_for(:job, employer: boss) }
			end
			it 'creates a @job' do
				expect(assigns(:job)).to be_instance_of Job
			end
			it 'creates a job record in Job' do
				expect(Job.count).to eq(1)
			end
			it 'creates a flash success message' do
				expect(flash[:success]).to be_present
			end
			it 'redirect to jobs_path' do
				expect(response).to redirect_to jobs_path
			end
		end

		context 'with invalid input' do
			let(:boss) { Fabricate(:employer) }
			before do
				session[:employer_id] = boss.id
				post :create, params: { job: { title: 'janitor'} }
			end

			it "doesn't create a job in Job" do
				expect(Job.count).to eq(0)
			end

			it 'creates a flash warning message' do
				expect(flash[:warning]).to be_present
			end

			it 'render :new template' do
				expect(response).to render_template :new
			end
		end
	end

	describe 'GET show' do
		context "with signed in user" do
			it 'sets @job' do
				session[:user_id] = Fabricate(:user).id
				job = Fabricate(:job)

				get :show, params: { id: job.id }
				expect(assigns(:job)).to eq(job)			
			end
		end

		context "without signed in user" do
			it 'redirect to login path' do
				job = Fabricate(:job)

				get :show, params: { id: job.id }
				expect(response).to redirect_to login_path	
			end
		end
	end

	describe 'GET filter' do
		context 'with signed in user' do
			before do
				alice = Fabricate(:user)
				session[:user_id] = alice.id
			end

			it 'sets a @jobs' do
				job = Fabricate(:job, industry: 'IT')
				job2 = Fabricate(:job, industry: 'IT')
				get :filter, params: { job: { industry: 'IT'} }
				expect(assigns(:jobs)).to eq([job, job2])
			end

			it 'can filter based on selected criteria' do
				job = Fabricate(:job, industry: 'IT')
				job2 = Fabricate(:job, industry: 'ED')
				get :filter, params: { job: { industry: 'IT'} }
				expect(assigns(:jobs)).to eq([job])				
			end

			it 'render :index template' do
				job = Fabricate(:job, industry: 'IT')
				job2 = Fabricate(:job, industry: 'ED')
				get :filter, params: { job: { industry: 'IT'} }
				expect(response).to render_template :index
			end
		end

		context 'without signed in user' do
			it 'redirect to login page' do
				job = Fabricate(:job, industry: 'IT')
				job2 = Fabricate(:job, industry: 'ED')
				get :filter, params: { job: { industry: 'IT'} }
				expect(response).to redirect_to login_path
			end
		end
	end

	describe 'POST favourite' do
		it ''
	end
end