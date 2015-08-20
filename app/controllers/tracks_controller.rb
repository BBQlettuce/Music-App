class TracksController < ApplicationController
  before_action :check_if_logged_in

  def show
    @track = Track.find(params[:id])
    @album = @track.album
    render :show
  end

  def new
    @album = Album.find(params[:album_id])
    @track = Track.new
    render :new
  end

  def create
    @album = Album.find(track_params[:album_id])
    @track = @album.tracks.create(track_params)
    if @track.save
      render :show
    else
      redirect_to new_album_track_url(@album)
    end
  end

  def edit
    @track = Track.find(params[:id])
    render :edit
  end

  def update
    @track = Track.find(params[:id])
    if @track.update(track_params)
      @album = @track.album
      render :show
    else
      redirect_to edit_track_url(@track)
    end
  end

  def destroy
    track = Track.find(params[:id])
    track.destroy
    redirect_to album_url(track.album)
  end

  private
  def track_params
    params.require(:track).permit(:name, :album_id, :track_type, :lyrics)
  end
end
