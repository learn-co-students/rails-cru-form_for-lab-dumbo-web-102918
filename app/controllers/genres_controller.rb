class GenresController < ApplicationController
  def index
  end
  def new
    @genre = Genre.new
  end
  def create
    @genre = Genre.create(post_params(:name))
    redirect_to genre_path(@genre)
  end
  def edit
    @genre = Genre.find(params[:id])
  end
  def update
    @genre = Genre.find(params[:id])
    @genre.update(post_params(:name))
    redirect_to @genre
  end
  def show
    @genre = Genre.find(params[:id])
  end
  private
  def post_params(*arg)
    params.require(:genre).permit(*arg)
  end
end
