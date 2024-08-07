# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def authenticate_request!
    token = cookies[:jwt_token] || params[:jwt_token] || request.headers['Authorization']&.split&.last
    if token.present?
      begin
        decoded_token = decode_jwt(token)
        @current_user = User.find(decoded_token['sub'])
      rescue JWT::DecodeError, ActiveRecord::RecordNotFound
        redirect_to new_session_url
      end
    else
      redirect_to new_session_url
    end
  end

  def setup_jwt_cookie(token)
    cookies[:jwt_token] = {
      value: token,
      expires: 1.day.from_now,
      secure: Rails.env.production?,
      httponly: true
    }
  end

  def decode_jwt(token)
    secret_key = ENV.fetch('DEVISE_JWT_SECRET_KEY', nil)
    JWT.decode(token, secret_key, Rails.env.production?, algorithm: 'HS256').first
  end
end
