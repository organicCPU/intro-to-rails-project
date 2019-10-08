# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :artists
  resources :cards
  resources :colors
  resources :rulings

  root to: 'cards#index'
end
