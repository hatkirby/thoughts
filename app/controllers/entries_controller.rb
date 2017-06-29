class EntriesController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update]

  def show
    @entry = Entry.where(slug: params[:slug]).first
  end

  def edit
    @entry = Entry.where(slug: params[:slug]).first
  end

  def update
    @entry = Entry.where(slug: params[:slug]).first

    if @entry.update_attributes(entry_params)
      flash.notice = ""
    end
  end

  private

    def entry_params
      params.require(:blog).permit(:title, :body, :slug)
    end

end
