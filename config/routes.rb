# frozen_string_literal: true

Rails.application.routes.draw do
  resources :pages, only: :show
  get '/static/:permalink', to: 'pages#permalink', as: 'permalink'

  resources :artists, only: %i[index show]
  resources :cards, only: %i[index show]
  resources :colors, only: %i[index show]
  resources :rulings, only: %i[index show]

  root to: 'cards#index'
end
