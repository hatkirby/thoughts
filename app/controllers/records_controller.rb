class RecordsController < ApplicationController

  def index
    @records = Record.order(created_at: :desc).limit(20)
  end

end
