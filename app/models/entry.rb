class Entry < ApplicationRecord
  has_many :records, as: :recordable

  validates :slug, presence: true, format: /\A[-a-z0-9]+\z/

  def path
    "/says/#{slug}"
  end
end
