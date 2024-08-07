# frozen_string_literal: true

FactoryBot.define do
  factory :task_content do
    content { '' }
    task
  end
end
