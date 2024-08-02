
Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins %w[http://auth_service:3001 http://notification_service:3002 http://task_service:3004]
    resource '*',
             headers: :any,
             methods: [:get, :post, :put, :patch, :delete, :options, :head],
             expose: ['Authorization'],
             max_age: 600
  end
end