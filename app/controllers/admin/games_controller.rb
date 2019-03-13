class Admin::GamesController < Admin::AdminController
  before_action :set_section

  def index
    @games = Game.order(created_at: :desc)
  end

  def drafts
    @games = Game.where(created_at: :desc)
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)

    if @game.save
      flash.notice = "Game created successfully!"

      render :edit
    else
      flash.alert = "Error creating game."

      render :new
    end
  end

  def edit
    @game = Game.find(params[:id])
  end

  def update
    @game = Game.find(params[:id])

    if @game.update_attributes(game_params)
      flash.notice = "Game updated successfully!"
    else
      flash.alert = "Error updating game."
    end

    render :edit
  end

  private

    def game_params
      params.require(:game).permit(:title, :description, :status, :progress, :score, :started_on, :finished_on)
    end

    def set_section
      @section = "games"
    end

end
