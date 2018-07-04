class Blog < ApplicationRecord
  has_many :records, as: :recordable, inverse_of: :recordable

  validates :title, presence: true
  validates :body, presence: true, if: :published
  validates :slug, presence: true, format: /\A[-a-z0-9]+\z/, if: :published

  accepts_nested_attributes_for :records, allow_destroy: true

  before_validation :set_draft_title
  before_save :set_published_at

  def path
    "/says/#{slug}"
  end

  private
    def set_draft_title
      if self.title.blank? and not self.published
        self.title = "Untitled draft"
      end
    end

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
