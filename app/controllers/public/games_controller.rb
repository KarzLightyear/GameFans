class Public::GamesController < ApplicationController
  def index
    @genres = Genre.all
  end

  def create
    @game = Game.new(game_params)
    @game.customer_id = current_customer.id
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
