# status validation
module Visible
  # see doc about active support concern
  extend ActiveSupport::Concern

  VALID_STATUSES = %w[public private archived].freeze

  included do
    validates :status, inclusion: { in: VALID_STATUSES }
  end

  def archived?
    status == 'archived'
  end

  # class methods can also be added to concerns.
  # display a count for public articles or public comments
  class_methods do
    def public_count
      where(status: 'public').count
    end
  end
end
