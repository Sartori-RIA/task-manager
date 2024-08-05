class ApplicationController < ActionController::Base
  before_action :authenticate_request!

  def authenticate_request!
    token = cookies[:jwt_token] || params[:jwt_token] || request.headers['Authorization']&.split(' ')&.last
    puts token
    if token.present?
      begin
        decoded_token = decode_jwt(token)
        puts "decoded token"
        puts decoded_token
        @current_user = User.find(decoded_token['sub'])
      rescue JWT::DecodeError, ActiveRecord::RecordNotFound => e
        puts e
        redirect_to 'http://localhost:3001/users/sign_in'
      end
    else
      redirect_to 'http://localhost:3001/users/sign_in'
    end
  end

  def decode_jwt(token)
    secret_key = ENV['DEVISE_JWT_SECRET_KEY']
    JWT.decode(token, secret_key, Rails.env.production?, algorithm: 'HS256').first
  end
end
