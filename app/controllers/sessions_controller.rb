class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(user_params[:email], user_params[:password])
    if @user
      log_in_user! @user
      redirect_to user_url(@user.id)
    else
      flash[:errors] = "Invlaid Email and Password Combination!"
      render :new
    end
  end

  def destroy
    log_out_user!
    render :new
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end