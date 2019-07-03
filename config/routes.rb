Rails.application.routes.draw do
  resources :users
  resources :tweets
  root 'users#index'
  get 'users/new' => 'users#new'
  post 'users' => 'users#create'
end
