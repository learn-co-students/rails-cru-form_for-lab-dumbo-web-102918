class ArtistsController < ApplicationController
  def index
    @artists = Artist.all
  end

  def show
    @artist = find_artist_by_id
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(artist_params)
    if @artist.save
      redirect_to artist_path(@artist)
    else
      render('new')
    end
  end

  def edit
    @artist = find_artist_by_id
  end

  def update
    @artist = find_artist_by_id
    @artist.update(artist_params)
    redirect_to artist_path(@artist)
  end

  def destroy
    @artist = find_artist_by_id
    @artist.destroy
    redirect_to artists_path
  end

  def find_artist_by_id
    Artist.find(params[:id])
  end

  private
  def artist_params
    params.require(:artist).permit(:name, :bio)
  end
end
