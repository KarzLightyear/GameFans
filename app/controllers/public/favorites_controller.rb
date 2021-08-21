class Public::FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    @game = Game.find(params[:game_id])
    favorite = @game.favorites.new(user_id: current_user.id)
    favorite.save
  end

  def destroy
    @game = Game.find(params[:game_id])
    favorite = @game.favorites.find_by(user_id: current_user.id)
    favorite.destroy
  end
end
