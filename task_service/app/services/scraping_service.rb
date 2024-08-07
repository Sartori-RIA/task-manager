# frozen_string_literal: true

require 'httparty'

class ScrapingService
  include HTTParty
  base_uri 'http://scraping:3000/scrape'
  headers 'Content-Type' => 'application/json'

  def self.notify(task)
    body = { url: task.url, task_id: task.id, user_id: task.user_id }

    post('/', body: { scrape: body }.to_json)
  end
end
