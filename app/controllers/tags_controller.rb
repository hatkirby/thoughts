class TagsController < ApplicationController

  def suggest
    @tags = ActsAsTaggableOn::Tag.pluck(:name).select do |tag|
      tag.starts_with? params[:term]
    end

    render json: @tags
  end

end
