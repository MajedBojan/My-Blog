Rails.application.routes.draw do

  namespace :api, defoult: {:format => :json}do
  namespace :v1 do
  	resources :posts
  end
end
	get 'users/index'
	get 'sessions/login'
	get 'sessions/logout'

	post 'sessions/attempt_login'
	get 'pages/show'

	get 'login', :to => "admin_users#attempt_login"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
# match ':controller(/:action(/:id))', :via => [:get, :post]
resources :profileimages , :admin_users, :pages
resources :posts do
resources :comments
end

root "posts#index"
#match ':controller(/:action(/:id))' , :via => [:get,:post]
get "/about", to: "pages#about"
end
