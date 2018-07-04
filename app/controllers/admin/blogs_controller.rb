class Admin::BlogsController < Admin::AdminController
  before_action :set_section

  def index
    @blogs = Blog.where(published: true).order(published_at: :desc)
  end

  def drafts
    @blogs = Blog.where(published: false).order(updated_at: :desc)
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)

    if @blog.save
      flash.notice = "Blog created successfully!"

      render :edit
    else
      flash.alert = "Error creating blog."

      render :new
    end
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    @blog = Blog.find(params[:id])

    if @blog.update_attributes(blog_params)
      flash.notice = "Blog updated successfully!"
    else
      flash.alert = "Error updating blog."
    end

    render :edit
  end

  private

    def blog_params
      params.require(:blog).permit(:title, :body, :slug, :published, records_attributes: [:description, :_destroy])
    end

    def set_section
      @section = "blogs"
    end

end
