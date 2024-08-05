# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    super do |user|
      if user.persisted?
        token = Warden::JWTAuth::UserEncoder.new.call(user, :user, nil).first
        cookies[:jwt_token] = {
          value: token,
          expires: 1.day.from_now,
          secure: Rails.env.production?,
          httponly: true
        }
      end
    end
  end

  # DELETE /resource/sign_out
  def destroy
    super do
      cookies.delete(:jwt_token)
    end
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
