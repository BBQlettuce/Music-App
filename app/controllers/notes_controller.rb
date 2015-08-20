class NotesController < ApplicationController
  before_action :check_if_logged_in

  def new
    @track = Track.find(params[:id])
    @note = Note.new
    render :new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def note_params
    params.require(:note).permit(:user_id, :track_id, :text)
  end
end
