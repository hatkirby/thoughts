module Recordable
  extend ActiveSupport::Concern

  included do
    has_many :records, as: :recordable, inverse_of: :recordable

    accepts_nested_attributes_for :records, allow_destroy: true
  end
end
