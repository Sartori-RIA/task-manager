# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "email#{n}@email.com" }
    password { "123456" }
    name { 123456 }
  end
end
