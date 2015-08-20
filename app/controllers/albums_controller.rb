class AlbumsController < ApplicationController
  before_action :check_if_logged_in

  def show
    @album = Album.find(params[:id])
    render :show
  end

  def new
    @band = Band.find(params[:band_id])
    @album = Album.new
    render :new
  end

  def create
    @band = Band.find(album_params[:band_id])
    @album = @band.albums.create(album_params)
    if @album.save
      render :show
    else
      redirect_to new_band_album_url(@band)
    end
  end

  def edit
    @album = Album.find(params[:id])
    render :edit
  end

  def update
    @album = Album.find(params[:id])
    if @album.update(album_params)
      render :show
    else
      redirect_to edit_album_url(@album)
    end
  end

  def destroy
    album = Album.find(params[:id])
    album.destroy
    redirect_to albums_url
  end

  private
  def album_params
    params.require(:album).permit(:name, :band_id, :record_type)
  end

end
