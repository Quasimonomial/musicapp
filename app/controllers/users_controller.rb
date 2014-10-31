class UsersController < ApplicationController
  def index
    render json: User.all
  end

  def show
    @user = User.find(params[:id])
    render :show
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in_user! @user
      redirect_to user_url(@user.id)
    else
      flash[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def new
    render :new
  end
  
  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end