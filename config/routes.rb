# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  get '/register', to: 'users#new'

  get '/users/:id', to: 'users#show'
  post '/users', to: 'users#create'

  get '/users/:id/discover', to: 'users#discover'
end
