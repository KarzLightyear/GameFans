class Public::GenresController < ApplicationController
  def index
    @genre = Genre.new
    @genres = Genre.all.page(params[:page])
  end

  def show
    @gametitle = Genre.find(params[:id])
    @games = @gametitle.games
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end
end
