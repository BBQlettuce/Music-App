class NotesController < ApplicationController
  before_action :check_if_logged_in

  def create
    @track = Track.find(params[:track_id])
    @note = Note.create(
      user_id: current_user.id,
      track_id: @track.id,
      text: note_params[:text])
    redirect_to track_url(@track)
  end

  # def edit
  # end
  #
  # def update
  # end

  def destroy
    note = Note.find(params[:id])
    if note.user != current_user
      render text: "403 FORBIDDEN"
    else
      note.destroy
      redirect_to track_url(note.track)
    end
  end

  private

  def note_params
    params.require(:note).permit(:text)
  end
end
