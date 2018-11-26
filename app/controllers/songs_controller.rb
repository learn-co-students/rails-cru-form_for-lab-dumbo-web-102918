class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def show
    @song = find_song_by_id
  end

  def new
    @song = Song.new
    @artists = Artist.all
    @genres = Genre.all
  end

  def edit
    @song = find_song_by_id
  end

  def create
    @song = Song.new(song_params)
    if @song.save
      redirect_to songs_path
    else
      render('new')
    end

  end

  def update
    @song = find_song_by_id
    @song.update(song_params)
    redirect_to songs_path
  end

  def find_song_by_id
    Song.find(params[:id])
  end

  private
  def song_params
    params.require(:song).permit(:name, :artist_id, :genre_id)
  end
end
