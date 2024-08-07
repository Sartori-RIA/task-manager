# frozen_string_literal: true

FactoryBot.define do
  factory :task do
    status { Task.statuses.sample }
    url { 'MyString' }
    user
    trait :in_progress do
      status { :in_progress }
    end
    trait :completed do
      status { :completed }
    end
    trait :failed do
      status { :failed }
    end
    trait :pending do
      status { :pending }
    end
  end
end
