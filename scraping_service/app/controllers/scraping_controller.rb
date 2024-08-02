# frozen_string_literal: true

class ScrapingController < ApplicationController
  before_action :authenticate_user!

  def scrape
    scraping_service = ScrapingService.new(params[:url])
    result = scraping_service.scrape
    render json: result
  end
end
