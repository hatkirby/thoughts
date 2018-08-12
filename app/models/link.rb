class Link < ApplicationRecord
  include Recordable

  acts_as_taggable

  validates :title, :url, presence: true

  def path
    url
  end

  def taggable
    self
  end
end
