# frozen_string_literal: true

class Notification < ApplicationRecord
  validates :title, :message, presence: true

  belongs_to :task, optional: false
  belongs_to :user, optional: false
end
