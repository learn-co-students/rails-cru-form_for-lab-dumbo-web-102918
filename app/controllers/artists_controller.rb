class ArtistsController < ApplicationController
  def index
  end
  def new
    @artist = Artist.new
  end
  def create
    @artist = Artist.create(post_params(:name, :bio))
    redirect_to artist_path(@artist)
  end
  def show
    @artist = Artist.find(params[:id])
  end
  def edit
    @artist = Artist.find(params[:id])
  end
  def update
    @artist = Artist.find(params[:id])
    @artist.update(post_params(:name, :bio))
    redirect_to @artist
  end
  private
  def post_params(*arg)
    params.require(:artist).permit(*arg)
  end
end
