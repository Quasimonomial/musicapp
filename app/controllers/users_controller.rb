class UsersController < ApplicationController
  def index
    render json: User.all
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_url(@user.id)
    else
      render json: @user.errors.full_messages
    end
  end

  def new
    User.new
  end
  
  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end