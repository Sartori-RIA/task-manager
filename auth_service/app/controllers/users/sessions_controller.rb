# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # respond_to :json

  # private

  # def current_token
  #   request.env['warden-jwt_auth.token']
  # end
end
