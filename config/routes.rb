Rails.application.routes.draw do

  get 'users', to: 'users#index', as: 'users'

  get '/users/:id/posts', to: 'posts#index', as: 'posts'
  get '/users/:id/posts/:post_id', to: 'posts#show', as: 'post'
  get '/users/:id/posts/new', to: 'posts#new', as: 'new_post'
  post '/users/:id/posts', to: 'posts#create'
  get '/users/:id/posts/:post_id/edit', to: 'posts#edit', as: 'edit_post'
  patch '/users/:id/posts/:post_id', to: 'posts#update'
  delete '/users/:id/posts/:post_id', to: 'posts#destroy', as: 'delete_post'

  get 'users/:id', to: 'users#show', as: 'user'
  get '/auth/:github/callback', to: 'users#login', as: 'login'
  delete '/users/logout', to: 'users#logout', as: 'logout'

  root to: 'users#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
