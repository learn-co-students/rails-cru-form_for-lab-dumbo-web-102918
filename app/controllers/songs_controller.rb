class SongsController < ApplicationController
  def index
    @songs = Song.all
  end
  def new
    @song = Song.new
  end
  def create
    # byebug
    @song = Song.create(post_params(:name, :genre_id, :artist_id))
    redirect_to song_path(@song)
  end
  def edit
    @song = Song.find(params[:id])
  end
  def update
    @song = Song.find(params[:id])
    @song.update(post_params(:name))
    redirect_to @song
  end
  def show
    @song = Song.find(params[:id])
  end
  private
  def post_params(*arg)
    params.require(:song).permit(*arg)
  end
end
