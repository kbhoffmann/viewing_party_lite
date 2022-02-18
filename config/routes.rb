Rails.application.routes.draw do
  root 'welcome#index'

  get '/login', to: 'users#login_form'
  post '/login', to: 'users#login_user'
  delete '/logout', to: 'users#logout_user'

  get '/register', to: 'users#new'

  get '/dashboard', to: 'users#show'
  post '/users', to: 'users#create'

  get '/discover', to: 'users#discover'
  get '/movies', to: 'movies#index'
  get '/movies/:movie_id', to: 'movies#show'
  get '/movies/:movie_id/viewing-party/new', to: 'partys#new'
  post '/movies/:movie_id/viewing-party/new', to: 'partys#create'
end
