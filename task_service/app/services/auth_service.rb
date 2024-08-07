# frozen_string_literal: true

require 'httparty'

class AuthService
  include HTTParty
  base_uri 'http://auth:3000/users'
  headers 'Content-Type' => 'application/json'

  class << self
    def sign_in(email:, password:)
      response = post('/sign_in', body: { user: { email:, password: } }.to_json)
      token = response.headers[:Authorization]&.gsub('Bearer', '')&.strip

      [response, token]
    end

    def sign_up(email:, password:, name:)
      response = post('/', body: { user: { email:, password:, name: } }.to_json)
      token = response.headers[:Authorization]&.gsub('Bearer', '')&.strip

      [response, token]
    end

    def sign_out
      delete('/sign_out')
    end
  end
end
