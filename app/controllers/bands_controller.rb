class BandsController < ApplicationController
  before_action :check_if_logged_in

  def check_if_logged_in
    redirect_to new_session_url if !logged_in?
  end

  def index
    @bands = Band.all
    render :index
  end

  def show
    @band = Band.find(params[:id])
    render :show
  end

  def new
    @band = Band.new
    render :new
  end

  def create
    band = Band.new(band_params)
    if band.save
      render :show
    else
      redirect_to new_band_url
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def band_params
    params.require(:band).permit(:name)
  end

end
