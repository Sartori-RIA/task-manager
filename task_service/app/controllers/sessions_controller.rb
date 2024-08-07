# frozen_string_literal: true

class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    response, token = AuthService.sign_in(password: sign_in_params[:password], email: sign_in_params[:email])
    if response.code == 204
      @current_user = response.body
      setup_jwt_cookie(token)
      redirect_to tasks_url
    else
      flash[:error] = response.body
      redirect_to new_session_url
    end
  end

  def destroy
    AuthService.sign_out
    cookies.delete(:jwt_token)
    redirect_to new_session_url
  end

  protected

  def sign_in_params
    params.require(:user).permit(:email, :password)
  end
end
