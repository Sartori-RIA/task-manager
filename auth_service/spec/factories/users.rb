# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "email_#{n}@example.com" }
    password { '123456' }
    name { 'user name' }
  end
end
