Rails.application.routes.draw do

  get 'hello_world', to: 'hello_world#index'
  get 'contacts/index'

  get 'contacts/show'

  get 'contacts/new'

  get 'contacts/edit'

  namespace :api, defoult: {:format => :json}do
  namespace :v1 do
  	resources :posts
  end
end
	get 'users/index'
	get 'sessions/login'
	get 'sessions/logout'

	post 'sessions/attempt_login'
	# get 'pages/show'

  resources :pages
  resources :contacts
  resources :posts do
    resources :comments
  end

root "posts#index"
#match ':controller(/:action(/:id))' , :via => [:get,:post]
get "/about", to: "pages#about"
end
