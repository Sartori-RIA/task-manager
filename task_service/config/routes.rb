# frozen_string_literal: true

Rails.application.routes.draw do
  resources :tasks
  get '/sessions/sign_in' => 'sessions#new'
  post '/sessions/sign_in' => 'sessions#create'
  delete '/sessions/sign_out' => 'sessions#destroy'
  resources :registrations, only: %i[new create], path: 'sign_up'

  get 'up' => 'rails/health#show', as: :rails_health_check
end
