class StreamsController < ApplicationController

  def show
    @stream = Stream.find_by_slug(params[:slug])
  end

end
