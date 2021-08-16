class Public::GamesController < ApplicationController
  def index
    @genres = Genre.all
  end

  def create
    
    @game = Game.new(game_params)
    @game.customer_id = current_customer.id
    if @game.save!

      redirect_to game_path(@game), notice: "You have created game successfully."
    else
      #@game = Game.find(params[:id])
      #render template: "games/show"
    end
  end

  def new
    @gamenew = Game.new
  end

  def show
    @gametitle = Genre.find(params[:id])
    @gamenew = Game.new
    @games = Game.all
    @game = Game.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def game_params
    params.require(:game).permit(:title, :body)
  end



end
