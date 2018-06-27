require 'rails_helper'

describe EmployersController do
	describe 'GET show' do
		context "with signed in user" do
			it 'sets @employer' do
				session[:user_id] = Fabricate(:user).id
				employer = Fabricate(:employer)

				get :show, params: { id: employer.id }
				expect(assigns(:employer)).to eq(employer)
			end
		end

		context 'without signed in user' do
			it 'redirect to sign in path' do
				employer = Fabricate(:employer)

				get :show, params: { id: employer.id }
				expect(response).to redirect_to login_path
			end
		end
	end

	describe 'GET new' do
		it 'creates @employer instance variable' do
			get :new
			expect(assigns(:employer)).to be_instance_of Employer
		end
	end

	describe 'POST create' do

	end
end