# frozen_string_literal: true

Rails.application.routes.draw do
  # get '/static', to: root_path

  resources :artists, only: %i[index show]
  resources :cards, only: %i[index show]
  resources :colors, only: %i[index show]
  resources :rulings, only: %i[index show]

  # Catch-all
  resources :pages, only: :show
  get '/:permalink', to: 'pages#permalink', as: 'permalink'

  root to: 'cards#index'
end
