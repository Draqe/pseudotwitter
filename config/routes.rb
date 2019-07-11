Rails.application.routes.draw do
  resources :users do
    resources :tweets do
      resources :retweets, controller: 'tweets', type: 'Retweet'
    end
  end
  resources :sessions
  root 'sessions#index'
end
