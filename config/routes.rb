Rails.application.routes.draw do 
  
	root "articles#index"
	#root "users#new"
	resources :articles do
    	resources :usercomments
  	end
  devise_config = ActiveAdmin::Devise.config
  devise_config[:controllers][:omniauth_callbacks] = "admin_users/omniauth_callbacks"
  devise_for :admin_users, devise_config
  ActiveAdmin.routes(self)
  devise_for :users
  #get ‘auth/:provider/callback’, to: ‘sessions#googleAuth’
  #get ‘auth/failure’, to: redirect(‘/’)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
