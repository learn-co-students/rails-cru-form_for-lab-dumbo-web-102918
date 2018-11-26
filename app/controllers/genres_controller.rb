class GenresController < ApplicationController
  def index
      @genres = Genre.all
  end

  def new
    @genre = Genre.new
  end

  def show
    @genre = find_genre_by_id
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to genre_path(@genre)
    else
      render('new')
    end
  end

  def edit
    @genre = find_genre_by_id
  end

  def update
    @genre = find_genre_by_id
    @genre.update(genre_params)
    redirect_to genre_path(@genre)
  end

  def find_genre_by_id
    Genre.find(params[:id])
  end

  private
  def genre_params
    params.require(:genre).permit(:name)
  end
end
