class Record < ApplicationRecord
  belongs_to :recordable, polymorphic: true

  validates :description, :recordable, presence: true
end
