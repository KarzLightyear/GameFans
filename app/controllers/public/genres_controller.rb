class Public::GenresController < ApplicationController

  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def show
    @gametitle = Genre.find(params[:id])
    @games = @gametitle.games
    #@game = @gametitle.user
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end

end
