require 'rails_helper'

describe FavouritesController do
	describe 'POST create' do
		let(:alice) { Fabricate(:user) }
		let(:job) { Fabricate(:job) }

		before do
			session[:user_id] = alice.id
		end

		it 'create a favourite job in the current user' do
			post :create, params: { job_id: job.id }
			expect(alice.favourite_jobs).to eq([job])
		end

		it 'create a flash message' do
			post :create, params: { job_id: job.id }
			expect(flash[:success]).to be_present
		end

		it 'redirect to the job show path' do
			post :create, params: { job_id: job.id }
			expect(response).to redirect_to job_path(job)
		end
	end
end