Rails.application.routes.draw do
  resources :tweets
  resources :users
  resources :sessions
  root 'sessions#index'
end
