class Public::GameCommentsController < ApplicationController

  def create
    @genre = Genre.find(params[:genre_id])
    @game = Game.find(params[:game_id])
    @game_comment = GameComment.new
    comment = current_user.game_comments.new(game_comment_params)
    comment.game_id = @game.id
    comment.save
  end

  def destroy
    @genre = Genre.find(params[:genre_id])
  	@game = Game.find(params[:game_id])
    @game_comment = GameComment.find(params[:id])
    @game_comment.destroy
  end

  private

  def game_comment_params
    params.require(:game_comment).permit(:comment)
  end

end
