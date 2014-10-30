class SessionsController < ApplicationController
  def new
    render json: "hi!"
  end

  def create
    @user = User.find_by_credentials(user_params[:username], user_params[:password])
    if @user
      log_in_user! @user
      redirect_to user_url(@user.id)
    else
      render json: "You have an invalid username or password"
    end
  end

  def destroy
    log_out_user!
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end