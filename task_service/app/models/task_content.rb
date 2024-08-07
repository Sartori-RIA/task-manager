# frozen_string_literal: true

class TaskContent < ApplicationRecord
  validates :content, presence: true

  belongs_to :task, optional: false
end
