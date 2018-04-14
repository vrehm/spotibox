Rails.application.routes.draw do
  get 'users/spotify'
  root 'welcome#index'
  get '/auth/spotify/callback', to: 'users#spotify'
end
