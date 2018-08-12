class Admin::LinksController < Admin::AdminController
  before_action :set_section

  def index
    @links = Link.order(created_at: :desc)
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.new(link_params)

    if @link.save
      flash.notice = "Link created successfully!"

      render :edit
    else
      flash.alert = "Error creating link."

      render :new
    end
  end

  def edit
    @link = Link.find(params[:id])
  end

  def update
    @link = Link.find(params[:id])

    if @link.update_attributes(link_params)
      flash.notice = "Link updated successfully!"
    else
      flash.alert = "Error updating link."
    end

    render :edit
  end

  private

    def link_params
      params.require(:link).permit(:title, :url, :tag_list, records_attributes: [:description, :_destroy])
    end

    def set_section
      @section = "links"
    end

end
