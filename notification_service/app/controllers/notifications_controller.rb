# frozen_string_literal: true

class NotificationsController < ApplicationController
  def index
    @notifications = Notification.where(user_id: params[:user_id]).order(id: :desc)
    render json: @notifications
  end

  def create
    notification = Notification.new(notification_params)
    if notification.save
      render json: notification, status: :created
    else
      render json: notification.errors, status: :unprocessable_entity
    end
  end

  private

  def notification_params
    params.require(:notification).permit(:title, :message, :task_id, :user_id)
  end
end
