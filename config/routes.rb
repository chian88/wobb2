Rails.application.routes.draw do
	# get 'ui/:action', controller: 'ui'

	root to: 'pages#front'
	get 'register_page', to: 'pages#register'

	resources :jobs, only: [:index, :show] do
		resources :applications, only: [:create, :index]
		# post '/apply', to: 'job_applications#create'
		# get '/application', to: 'jobs#applicants'
	end
	get '/filter_job', to: 'jobs#filter'


	get '/register_employer', to: 'employers#new'
	resources :employers, only: [:show, :create]

	get '/login', to: 'sessions#new'
	get '/logout', to: 'sessions#destroy'
	resources :sessions, only: [:create]

	get '/register_user', to: 'users#new'
	resources :users, only: [:create, :edit, :update]

	get '/dashboard', to: 'users#show'



end
