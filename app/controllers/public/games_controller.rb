class Public::GamesController < ApplicationController
  def index
    @genres = Genre.all
  end

  def create
    @game = Game.new(game_params)
    @game.user_id = current_user.id
    if @game.save!

      redirect_to genre_path(@game.genre_id), notice: "You have created game successfully."
    else
      #@game = Game.find(params[:id])
      #render template: "games/show"
    end
  end

  def new
    @gamenew = Game.new
  end

  def show
    @game = Game.find(params[:id])
    @game_comment = GameComment.new
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def game_params
    params.require(:game).permit(:title, :body, :genre_id)
  end



end
