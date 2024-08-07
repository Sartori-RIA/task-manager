# frozen_string_literal: true

Rails.application.routes.draw do
  resources :tasks
  resources :sessions, only: %i[new create destroy]
  resources :registrations, only: %i[new create]

  get 'up' => 'rails/health#show', as: :rails_health_check
end
