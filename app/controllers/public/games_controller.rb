class Public::GamesController < ApplicationController
  def index
    @genres = Genre.all
  end

  def create
    @game = Game.new(game_params)
    @game.user_id = current_user.id
    @game.score = Language.get_data(game_params[:body])  # API機能の追加
    if @game.save
      redirect_to genre_path(@game.genre_id)
    else
      @gametitle = Genre.find(game_params[:genre_id])
      @games = @gametitle.games
      render 'public/genres/show'
    end
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
