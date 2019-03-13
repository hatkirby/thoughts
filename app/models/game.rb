class Game < ApplicationRecord
  extend Enumerize

  audited only: [:status, :progress]

  validates :title, presence: true
  validates :status, presence: true

  enumerize :status,
    in: [:playing, :upcoming, :held, :dropped, :finished],
    default: :upcoming

end
