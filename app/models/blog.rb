class Blog < ApplicationRecord
  has_many :records, as: :recordable, inverse_of: :recordable

  validates :title, :body, presence: true
  validates :slug, presence: true, format: /\A[-a-z0-9]+\z/

  accepts_nested_attributes_for :records, allow_destroy: true

  before_save :set_published_at

  def path
    "/says/#{slug}"
  end

  def posted_at
    if published
      published_at
    else
      updated_at
    end
  end

  private
    def set_published_at
      if self.published
        if self.published_at.blank?
          self.published_at = DateTime.now
        end
      else
        self.published_at = nil
      end
    end
end
