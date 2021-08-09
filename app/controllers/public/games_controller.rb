class Public::GamesController < ApplicationController
  def index
  end
  
  def list
    @games = Game.all
    @game = Game.new
  end
  
  def create
    @game = Game.new(game_params)
    @game.customer_id = current_customer.id
    if @game.save
      redirect_to game_path(@game), notice: "You have created game successfully."
    else
      @games = Game.all
      render 'list'
    end
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
    params.require(:game).permit(:title, :body)
  end

  def ensure_correct_customer
    @game = game.find(params[:id])
    unless @game.customer == current_customer
      redirect_to games_path
    end
  end
  
end
