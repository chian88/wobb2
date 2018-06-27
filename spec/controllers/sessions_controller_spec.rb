require 'rails_helper'

describe SessionsController do
	describe "GET new" do
		context 'with signed in user already' do
			it 'sets a flash message' do
				session[:user_id] = Fabricate(:user).id
				get :new
				expect(flash[:primary]).to be_present
			end

			it 'redirect to jobs path' do
				session[:user_id] = Fabricate(:user).id
				get :new
				expect(response).to redirect_to jobs_path
			end
		end
	end
	describe "POST create" do
		let(:alice) { Fabricate(:user) }

		context 'with authenticated user' do
			before do
				post :create, params: { email: alice.email, password: alice.password }
			end

			it 'puts the signed in user to the session' do
				expect(session[:user_id]).to eq(alice.id)
			end
			it 'sets a flash message' do
				expect(flash[:success]).to be_present
			end

			it 'redirect to jobs index page' do
				expect(response).to redirect_to jobs_path
			end
		end

		context 'with unauthenticated user' do
			before do
				post :create, params: { email: alice.email, password: alice.password + "xyz" }
			end

			it 'does not put a user in the session' do
				expect(session[:user_id]).to be_nil
			end
			it 'sets the error message' do
				expect(flash[:warning]).to be_present
			end
			it 'redirect to login path' do
				expect(response).to redirect_to login_path
			end
		end	
	end

	describe 'DELETE destroy' do
		before do
			session[:user_id] = Fabricate(:user).id
		end
		it 'sets the session[:user_id] to nil' do
			delete :destroy
			expect(session[:user_id]).to be_nil
		end

		it 'create a flash success message' do
			delete :destroy
			expect(flash[:success]).to be_present
		end

		it 'redirect to root path' do
			delete :destroy
			expect(response).to redirect_to root_path
		end
	end
end