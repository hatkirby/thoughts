class BlogsController < ApplicationController

  def show
    @blog = Blog.find_by_slug(params[:slug])

    raise ActiveRecord::RecordNotFound unless @blog
    raise ActiveRecord::RecordNotFound unless @blog.published
  end

end
