Rails.application.routes.draw do
  resources :users do
    resources :tweets
  end
  resources :sessions
  root 'sessions#index'
end
