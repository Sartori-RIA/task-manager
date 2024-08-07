# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users,
             defaults: { format: :json },
             controllers: {
               sessions: 'sessions'
             }

  get 'up' => 'rails/health#show', as: :rails_health_check
end
