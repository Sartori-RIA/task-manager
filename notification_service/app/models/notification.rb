# frozen_string_literal: true

class Notification < ApplicationRecord

  validates :title, :message, :task_id, presence: true

  belongs_to :user, optional: false
end
