class Stream < ApplicationRecord
  include Recordable

  has_many :updates

  validates :title, presence: true
  validates :slug, presence: true, format: /\A[-a-z0-9]+\z/

  def path
    "/thinks/#{slug}"
  end
end
