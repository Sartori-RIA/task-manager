# frozen_string_literal: true

require 'httparty'

class MyScrapingService
  include HTTParty

  def self.fetch_url_data(url:, task_id:, user_id:)
    task = Task.find(task_id)
    task.in_progress!
    user_agent = 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'

    response = get(url, headers: { 'User-Agent' => user_agent })
    if response.code != 200
      task.failed!
      return NotificationService.error(task_id, user_id)
    end

    doc = Nokogiri::HTML5(response.body)
    content = {
      brand: doc.at_css('#VehicleBasicInformationTitle')&.text&.strip,
      model: doc.at_css('#VehicleBasicInformationTitle')&.text&.strip,
      price: doc.at_css('#vehicleSendProposalPrice')&.text&.strip
    }
    @model = TaskContent.new(task_id:, content:)
    if @model.save
      Rails.logger.debug @model
    else
      Rails.logger.debug @model.errors.full_messages
    end
    task.completed!
    NotificationService.success(task_id, user_id)
  end
end
