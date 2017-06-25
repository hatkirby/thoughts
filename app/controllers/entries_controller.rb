class EntriesController < ApplicationController

  def show
    @entry = Entry.where(directory: params[:directory], slug: params[:slug]).first
  end

end
