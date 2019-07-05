Rails.application.routes.draw do
  resources :tweets
  resources :users
  root 'users#index'
end
