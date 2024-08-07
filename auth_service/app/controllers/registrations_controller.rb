# frozen_string_literal: true

class RegistrationsController < Devise::RegistrationsController
  def create
    @user = User.new(sign_up_params)
    if @user.save
      sign_in @user, store: false
    else
      render json: @user.errors.full_messages.to_sentence, status: :unprocessable_content
    end
  end
end
