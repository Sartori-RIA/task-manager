Rails.application.routes.draw do
  devise_for :users

  resources :scraping, only: [] do
    post :scrape
  end

  get "up" => "rails/health#show", as: :rails_health_check
end
