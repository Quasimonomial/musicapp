class SessionsController < ApplicationController
  def new
    render json: "hi!"
  end

  def create

  end

  def destroy user
    session[:session_token] = ""
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end