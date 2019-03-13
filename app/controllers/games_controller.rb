class GamesController < ApplicationController
  def index
    @games = Game.all

    if params[:status]
      @games = @games.where(status: params[:status])
    end
  end
end
