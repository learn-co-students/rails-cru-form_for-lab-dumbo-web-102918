class SongsController < ApplicationController
  def index
    @songs = Song.all
  end
  def new
    @song = Song.new
  end
  def create
    # byebug
    @song = Song.create(song_params(:name, :genre_id, :artist_id))
    redirect_to song_path(@song)
  end
  def edit
    @song = Song.find(params[:id])
  end
  def update
    @song = Song.find(params[:id])
    @song.update(song_params(:name))
    redirect_to @song
  end
  def show
    @song = Song.find(params[:id])
  end
  private
  def song_params(*arg)
    params.require(:song).permit(*arg)
  end
end
