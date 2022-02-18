# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  get '/register', to: 'users#new'

  get '/login', to: 'users#login_form'
  get '/logout', to: 'users#logout'
  post '/login', to: 'users#login_user'


  get '/users/dashboard', to: 'users#show'



  post '/users', to: 'users#create'

  get '/users/discover', to: 'users#discover'
  get '/users/movies', to: 'movies#index'
  get '/users/movies/:movie_id', to: 'movies#show'
  get '/users/movies/:movie_id/viewing-party/new', to: 'partys#new'
  post '/users/movies/:movie_id/viewing-party/new', to: 'partys#create'
end
