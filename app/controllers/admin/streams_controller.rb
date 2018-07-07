class Admin::StreamsController < Admin::AdminController
  before_action :set_section

  def index
    @streams = Stream.order(created_at: :desc)
  end

  def new
    @stream = Stream.new
  end

  def create
    @stream = Stream.new(stream_params)

    if @stream.save
      flash.notice = "Stream created successfully!"

      render :edit
    else
      flash.alert = "Error creating stream."

      render :new
    end
  end

  def edit
    @stream = Stream.find(params[:id])
  end

  def update
    @stream = Stream.find(params[:id])

    if @stream.update_attributes(stream_params)
      flash.notice = "Stream updated successfully!"
    else
      flash.alert = "Error updating stream."
    end

    render :edit
  end

  private

    def stream_params
      params.require(:stream).permit(:title, :body, :slug, :tag_list, records_attributes: [:description, :_destroy])
    end

    def set_section
      @section = "streams"
    end

end
