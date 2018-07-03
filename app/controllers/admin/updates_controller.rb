class Admin::UpdatesController < Admin::AdminController
  before_action :set_section

  def new
    @stream = Stream.find(params[:stream_id])
    @update = @stream.updates.build
  end

  def create
    @stream = Stream.find(params[:stream_id])
    @update = @stream.updates.build(update_params)

    if @update.save
      flash.notice = "Update created successfully!"

      render :edit
    else
      flash.alert = "Error creating update."

      render :new
    end
  end

  def edit
    @stream = Stream.find(params[:stream_id])
    @update = Update.find(params[:id])
  end

  def update
    @stream = Stream.find(params[:stream_id])
    @update = Update.find(params[:id])

    if @update.update_attributes(update_params)
      flash.notice = "Update updated successfully!"
    else
      flash.alert = "Error updating update."
    end

    render :edit
  end

  private

    def update_params
      params.require(:update).permit(:body, records_attributes: [:description, :_destroy])
    end

    def set_section
      @section = "streams"
    end

end
