Rails.application.routes.draw do
  resources :tweets
	resources :users
 	root 'users#index'
 	get 'users/new' => 'users#new'
 	post 'users' => 'users#create'
end
