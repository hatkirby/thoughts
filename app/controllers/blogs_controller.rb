class BlogsController < ApplicationController

  def show
    @blog = Blog.find_by_slug(params[:slug])
  end

end
