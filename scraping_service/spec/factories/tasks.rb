# frozen_string_literal: true

FactoryBot.define do
  factory :task do
    status { Task.statuses.sample }
    url { 'MyString' }
    user
  end
end
