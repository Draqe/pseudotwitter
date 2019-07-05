Rails.application.routes.draw do
  get 'welcome/index'
  root 'welcome#index'
  get '/tweets', to: 'tweets#index'
  get '/tweet/new', to: 'tweets#new', as: 'new_tweet'
  get '/tweets/:id', to: 'tweets#show', as: 'tweet'
  post '/tweets', to: 'tweets#create', as: 'create_tweet'
  get '/tweets/:id/edit', to: 'tweets#edit', as: 'edit_tweet'
  patch '/tweets/:id', to: 'tweets#update', as: 'update_tweet'
  delete '/tweets/:id', to: 'tweets#destroy', as: 'delete_tweet'
end
