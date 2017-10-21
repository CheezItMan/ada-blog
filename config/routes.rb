Rails.application.routes.draw do

  get 'users', to: 'users#index', as: 'users'
  get 'users/:id', to: 'users#show', as: 'user'
  get '/auth/:github/callback', to: 'users#login', as: 'login'
  delete '/users/logout', to: 'users#logout', as: 'logout'

  root to: 'users#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
