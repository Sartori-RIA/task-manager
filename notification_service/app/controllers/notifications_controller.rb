# frozen_string_literal: true

class NotificationsController < ApplicationController
  before_action :authenticate_user!

  def create
    notification = current_user.notifications.new(notification_params)
    if notification.save
      render json: notification, status: :created
    else
      render json: notification.errors, status: :unprocessable_entity
    end
  end

  private

  def notification_params
    params.require(:notification).permit(:title, :message, :task_id)
  end
end
