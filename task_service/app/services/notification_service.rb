# frozen_string_literal: true

require 'httparty'

class NotificationService
  include HTTParty
  base_uri 'http://notifications:3000/notifications'
  headers 'Content-Type' => 'application/json'

  def self.notify(task)
    body = {
      title: "Task #{task.status}",
      message: "Task #{task.id} is now #{task.status}",
      user_id: task.user.id,
      task_id: task.id
    }

    post('/', body: { notification: body }.to_json)
  end
end
