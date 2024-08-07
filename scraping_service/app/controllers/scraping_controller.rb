# frozen_string_literal: true

class ScrapingController < ApplicationController
  def scrape
    result = MyScrapingService.fetch_url_data(url: scrape_params[:url], task_id: scrape_params[:task_id],
                                              user_id: scrape_params[:user_id])
    render json: result
  end

  protected

  def scrape_params
    params.require(:scrape).permit(:url, :task_id, :user_id)
  end
end
