class GamesController < ApplicationController
  def index
    @games = Game.order(started_on: :desc)

    if params[:status]
      @games = @games.where(status: params[:status])
    end
  end
end
