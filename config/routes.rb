# frozen_string_literal: true

Rails.application.routes.draw do
  root 'messages#index'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get    '/logout',  to: 'sessions#show'

  resources :messages
  resources :users, only: %i[new create]
end
