class Blog < ApplicationRecord
  has_many :records, as: :recordable, inverse_of: :recordable

  validates :title, :body, presence: true
  validates :slug, presence: true, format: /\A[-a-z0-9]+\z/

  accepts_nested_attributes_for :records, allow_destroy: true

  def path
    "/says/#{slug}"
  end
end
