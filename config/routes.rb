Rails.application.routes.draw do
	# get 'ui/:action', controller: 'ui'

	root to: 'pages#front'
	get 'register_page', to: 'pages#register'

	resources :jobs, only: [:index, :show, :new, :create] do
		resources :applications, only: [:create, :index]
		resources :favourites, only: [:create, :index]
	end
	
	put '/hire', to: 'applications#hire'
	put '/reject', to: 'applications#reject'

	get '/filter_job', to: 'jobs#filter'

	get '/register_employer', to: 'employers#new'
	resources :employers, only: [:show, :create]

	get '/login', to: 'sessions#new'
	get '/logout', to: 'sessions#destroy'
	resources :sessions, only: [:create]

	get '/register_user', to: 'users#new'
	resources :users, only: [:create, :edit, :update, :show]

	get '/forgot_password', to: 'forgot_passwords#new'
	resources :forgot_passwords, only: [:create]

	resources :password_resets, only: [:show, :create]
	get '/expired_token', to: 'pages#expired_token'

	get '/forgot_password_confirmation', to: 'forgot_passwords#confirm'
end
