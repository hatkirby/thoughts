class Update < ApplicationRecord
  include Recordable

  belongs_to :stream

  validates :stream, :body, presence: true

  def path
    "/thinks/#{stream.slug}\#update-#{id}"
  end

  def taggable
    stream
  end
end
