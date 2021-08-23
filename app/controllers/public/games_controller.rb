class Public::GamesController < ApplicationController
  def index
    @genres = Genre.all
  end

  def create
    @game = Game.new(game_params)
    @game.user_id = current_user.id
    if @game.save!

      redirect_to genre_path(@game.genre_id), notice: 'You have created game successfully.'
    else
      # @game = Game.find(params[:id])
      # render template: "games/show"
    end
  end

  def new
    @gamenew = Game.new
  end

  def show
    @game = Game.find(params[:id])
    @game_comment = GameComment.new
    @genre = Genre.find(params[:genre_id])
  end

  def edit
    @game = Game.find(params[:id])
    redirect_to games_path if @game.user != current_user
  end

  def update
    @game = Game.find(params[:id])
    if @game.update(game_params)
      flash[:notice] = 'You have updated game successfully.'
      redirect_to game_path(@game.id)
    else
      render :edit
    end
  end

  def destroy
    @game = Game.find(params[:id])
    @game.destroy
    redirect_to genres_path
  end

  private

  def game_params
    params.require(:game).permit(:title, :body, :genre_id)
  end
end
