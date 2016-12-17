class PlaylistsController < ApplicationController
  before_action :require_login
  #before_action :require_correct_user
  def add
    @playlist = Playlist.create(user_id: current_user.id, song_id: params[:id])
    redirect_to '/songs'
  end
end
