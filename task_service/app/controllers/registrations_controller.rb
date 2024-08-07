# frozen_string_literal: true

class RegistrationsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    response, token = AuthService.sign_up(email: sign_up_params[:email], password: sign_up_params[:password],
                                          name: sign_up_params[:name])
    if response.code == 204
      @current_user = response.body
      setup_jwt_cookie(token)
      redirect_to tasks_url
    else
      flash[:errors] = response.body
      redirect_to registrations_url
    end
  end

  private

  def sign_up_params
    params.require(:user).permit(:name, :email, :password)
  end
end
