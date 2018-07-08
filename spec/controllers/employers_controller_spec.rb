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
		context 'with valid input' do
			before do
				post :create, params: { employer: Fabricate.attributes_for(:employer) }
			end
			it 'creates @employer' do
				expect(assigns(:employer)).to be_instance_of Employer
			end

			it 'creates a record in Employer' do
				expect(Employer.count).to eq(1)
			end

			it 'sets a flash[:success] message' do
				expect(flash[:success]).to be_present
			end

			it 'redirect to login page' do
				expect(response).to redirect_to login_path
			end
		end

		context 'with invalid input' do
			before do
				post :create, params: { employer: { name: 'insufficient data' } }
			end

			it 'does not create a record in Employer' do
				expect(Employer.count).to eq(0)
			end

			it 'sets a flash[:warning] message' do
				expect(flash[:warning]).to be_present
			end

			it 'render the :new template' do
				expect(response).to render_template :new
			end
		end
	end
end