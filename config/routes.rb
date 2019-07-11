Rails.application.routes.draw do
  resources :users do
    resources :tweets
    resources :retweets, controller: 'tweets', type: 'Retweet'
  end
  resources :sessions
  root 'sessions#index'
end
