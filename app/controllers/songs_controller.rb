class SongsController < ApplicationController

  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.create(song_params)
    redirect_to @song
  end

  def show
  fetch_song
  end

  def edit
  fetch_song
  end

  def update
    fetch_song
    @song.update(song_params)
    redirect_to @song
  end

  private

  def fetch_song
    @song = Song.find(params[:id])
  end

  def song_params
    params.require(:song).permit(:name, :artist_id, :genre_id)
  end
  
end
