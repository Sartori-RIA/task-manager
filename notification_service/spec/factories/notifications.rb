# frozen_string_literal: true

FactoryBot.define do
  factory :notification do
    sequence(:title) { |n| "notification_#{n}" }
    message { "some message" }
    user
  end
end
