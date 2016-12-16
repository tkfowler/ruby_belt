class SongsController < ApplicationController
  before_action :require_login, except: [:index, :show]
  def index
    @songs = Song.order(created_at: :desc)
  end

  def create
    @songs = Song.create( song_params )
    Playlist.create(user_id: @songs.user_id, song_id:@songs.id)
    if @songs.valid?
      redirect_to '/songs'
    else
      flash[:errors] = @songs.errors.full_messages
      redirect_to '/songs'
    end
  end

  def show
    @song = Song.find(params[:id])
  end

  private
  def song_params
    params.require(:song).permit(:artist, :title, :user_id)
  end
end
