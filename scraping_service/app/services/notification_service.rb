# frozen_string_literal: true

require 'httparty'

class NotificationService
  include HTTParty
  base_uri 'http://notifications:3000/notifications'
  headers 'Content-Type' => 'application/json'

  def self.success(task_id, user_id)
    body = { title: 'Task completed', message: "Task #{task_id} is now completed!", task_id:, user_id: }
    post('/', body: { notification: body }.to_json)
  end

  def self.error(task_id, user_id)
    body = { title: 'Task failed', message: "Task #{task_id} had failed", task_id:, user_id: }
    post('/', body: { notification: body }.to_json)
  end
end
