Rails.application.routes.draw do
  resources :users do
    resources :tweets
  resources :sessions
  root 'sessions#index'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
