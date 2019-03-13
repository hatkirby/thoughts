class GamesController < ApplicationController
  helper_method :sort_column, :sort_direction

  def index
    @games = Game.order(sort_column + " " + sort_direction)

    if params[:status]
      @games = @games.where(status: params[:status])
    end
  end

  private

    def sort_column
      (params[:sort] and Game.column_names.include?(params[:sort])) ? params[:sort] : "started_on"
    end

    def sort_direction
      (params[:dir] and %[asc desc].include?(params[:dir])) ? params[:dir] : "asc"
    end
end
