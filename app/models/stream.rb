class Stream < ApplicationRecord
  has_many :records, as: :recordable, inverse_of: :recordable
  has_many :updates

  validates :title, presence: true
  validates :slug, presence: true, format: /\A[-a-z0-9]+\z/

  accepts_nested_attributes_for :records, allow_destroy: true

  def path
    "/thinks/#{slug}"
  end
end
