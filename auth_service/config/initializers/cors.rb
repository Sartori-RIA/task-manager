
Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins %w[http://notification_service:3002 http://scraping_service:3003] # Adicione as origens permitidas
    resource '*',
             headers: :any,
             methods: [:get, :post, :put, :patch, :delete, :options, :head],
             expose: ['Authorization'],
             max_age: 600
  end
end