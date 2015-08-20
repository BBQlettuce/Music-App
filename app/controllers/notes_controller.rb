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
  end

  private

  def note_params
    params.require(:note).permit(:text)
  end
end
