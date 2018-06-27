require 'rails_helper'

describe UsersController do
	describe 'GET new' do
		it 'sets @user' do
			get :new
			expect(assigns(:user)).to be_instance_of(User)
		end
	end
	

	describe 'POST create' do
		context 'valid input' do
			before do 
				post :create, params: { user: Fabricate.attributes_for(:user) } 
			end
			it 'sets @user' do
				expect(assigns(:user)).to be_instance_of User
			end

			it 'created a user' do
				expect(User.count).to eq(1)
			end

			it 'sets success flash message' do
				expect(flash[:success]).to be_present
			end
		end

		context 'invalid input' do
			before do  
				post :create, params: { user: { email: 'kevin@example.com', password: 'password' }} 
			end

			it 'sets warning flash message' do
				expect(flash[:warning]).to be_present
			end

			it 'render :new view template' do
				expect(response).to render_template :new
			end
		end
	end

	describe 'GET show' do
		it 'sets the @user with logged in user' do
			alice = Fabricate(:user)
			session[:user_id] = alice.id
			get :show
			expect(assigns(:user)).to eq(alice)
		end

		it 'redirect to login page without logged in user' do
			get :show
			expect(response).to redirect_to login_path
		end
	end

	describe 'GET edit' do
		it 'sets the @user with logged in user' do
			alice = Fabricate(:user)
			session[:user_id] = alice.id
			get :edit, params: { id: alice.id }
			expect(assigns(:user)).to eq(alice)
		end

		it 'redirect to login page without logged in user' do
			get :edit, params: { id: 1 } 
			expect(response).to redirect_to login_path
		end		
	end

	describe 'PUT update' do
		context "with logged in user & valid input" do
			let(:alice) { Fabricate(:user) }
			before do
				session[:user_id] = alice.id
				put :update, params: { id: alice.id, user: { email: 'new@example.com', name: "new name", password: "password" } }
			end

			it 'sets @user' do
				expect(assigns(:user)).to be_instance_of User
			end

			it 'updates the user profile' do
				user = User.first
				expect(user.name).to eq("new name")
			end

			it 'sets the flash message' do
				expect(flash[:success]).to be_present
			end

			it 'redirect to dashboard path' do
				expect(response).to redirect_to dashboard_path
			end
		end

		context "with logged in user & invalid input" do
			it 'render :edit template for' do
				alice = Fabricate(:user)
				session[:user_id] = alice.id
				put :update, params: { id: alice.id, user: { email: 'new@example.com', password: "password", summary: Faker::Lorem.characters(500) } }
				expect(response).to render_template :edit
			end
		end
		context "without logged in user" do
			it 'redirect to the login path' do
				alice = Fabricate(:user)
				put :update, params: { id: alice.id, user: { email: 'new@example.com', name: "new name", password: "password" } }
				expect(response).to redirect_to login_path
			end
		end
	end
end