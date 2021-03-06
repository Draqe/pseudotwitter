Rails.application.routes.draw do
  resources :users do
    resources :tweets
    resources :replies, controller: 'tweets', type: 'Reply'
  end

  resources :tweets do
    resources :replies, controller: 'tweets', type: 'Reply'
  end

  resources :sessions
  root 'sessions#index'
end
