class GenresController < ApplicationController

  def index
    @genres = Genre.all
  end

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.create(genre_params)
    redirect_to @genre
  end

  def show
    fetch_genre
  end

  def edit
    fetch_genre
  end

  def update
    fetch_genre
    @genre.update(genre_params)
    redirect_to @genre
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end

  def fetch_genre
    @genre = Genre.find(params[:id])
  end
end
