class Stream < ApplicationRecord
  include Recordable

  acts_as_taggable

  has_many :updates

  validates :title, presence: true
  validates :slug, presence: true, format: /\A[-a-z0-9]+\z/

  def path
    "/thinks/#{slug}"
  end

  def taggable
    self
  end
end
