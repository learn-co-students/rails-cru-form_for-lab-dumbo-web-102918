class ArtistsController < ApplicationController

  def index
    @artists = Artist.all
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.create(artist_params)
    redirect_to @artist
  end

  def show
  fetch_artist
  end

  def edit
  fetch_artist
  end

  def update
    fetch_artist
    @artist.update(artist_params)
    redirect_to @artist
  end

  private

  def fetch_artist
    @artist = Artist.find(params[:id])
  end

  def artist_params
    params.require(:artist).permit(:name, :bio)
  end
end
