Rails.application.routes.draw do
  devise_for :users 
  
	root "articles#index"
	#root "users#new"
	resources :articles do
    	resources :usercomments
  	end
  devise_for :admin_users,ActiveAdmin::Devise.config
  devise_for :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  ActiveAdmin.routes(self)
  #get ‘auth/:provider/callback’, to: ‘sessions#googleAuth’
  #get ‘auth/failure’, to: redirect(‘/’)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
