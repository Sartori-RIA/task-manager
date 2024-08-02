Rails.application.routes.draw do
  devise_for :users

  resources :notifications, only: :create


  get "up" => "rails/health#show", as: :rails_health_check
end
