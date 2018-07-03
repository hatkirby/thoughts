class Update < ApplicationRecord
  has_many :records, as: :recordable, inverse_of: :recordable
  belongs_to :stream

  validates :stream, :body, presence: true

  accepts_nested_attributes_for :records, allow_destroy: true

  def path
    "/thinks/#{stream.slug}\#update-#{id}"
  end
end
