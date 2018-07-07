class Blog < ApplicationRecord
  include Recordable

  acts_as_taggable

  validates :title, presence: true
  validates :body, presence: true, if: :published
  validates :slug, presence: true, format: /\A[-a-z0-9]+\z/, if: :published

  before_validation :set_draft_title
  before_save :set_published_at

  def path
    "/says/#{slug}"
  end

  def taggable
    self
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
