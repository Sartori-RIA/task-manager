# frozen_string_literal: true

class NotificationService
  def self.notify(task)
    uri = URI.parse("http://notification_service:3002/notifications")
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Post.new(uri.request_uri, 'Content-Type' => 'application/json')
    request.body = {
      title: "Task #{task.status}",
      message: "Task #{task.id} is now #{task.status}",
      user_id: task.user.id,
      task_id: task.id
    }.to_json
    http.request(request)
  end
end