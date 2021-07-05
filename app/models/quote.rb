class Quote < ApplicationRecord
  before_validation :set_position

  validates :label, presence: true

  private

  def set_position
    self.position = (Quote.maximum(:position) || 0) + 1
  end
end
