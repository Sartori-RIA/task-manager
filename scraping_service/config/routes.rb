# frozen_string_literal: true

Rails.application.routes.draw do
  post '/scrape' => 'scraping#scrape'

  get 'up' => 'rails/health#show', as: :rails_health_check
end
