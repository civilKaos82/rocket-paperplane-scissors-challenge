class GamesController < ApplicationController
  before_action :set_game, only: [:destroy]

  def index
    @games = Game.all
  end

  def show
    @winner_throw = @game.winner_throw
    @loser_throw = @game.loser_throw
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)

    if @game.save
      redirect_to @game, notice: 'Game was successfully created.'
    else
      render :new
    end
  end

  def destroy
    redirect_to games_url, notice: 'Game was successfully destroyed.'
  end

  private
    def set_game
      @game = Game.find(params[:id])
    end

    def game_params
      params.require(:game).permit(:user_throw)
    end
end
