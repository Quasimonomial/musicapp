class BandsController < ApplicationController

  def create
    @band = Band.new(band_perams)
    if band.save!
      redirect_to user_url(current_user.id)
    else
      flash[:errors] = @band.errors.full_messages
      render :new
    end
  end

  def destroy
    @band = @band.find_by(band_perams[:id])
    @band.destroy!
    render :index
  end

  def index
    render :index
  end

  def new
    render :new
  end

  def show
    @band = Band.find(params[:id])
    render :show
  end

  def update
    @band = Band.find(params[:id])
    render :edit
  end

  private
  def band_perams
    params.require(:band).permit(:name)
  end


end