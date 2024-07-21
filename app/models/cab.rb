# frozen_string_literal: true

class Cab < ApplicationRecord
  scope :available, -> { where(is_available: true) }
  enum cab_type: { regular: "regular", premium: "premium" }, _default: :regular

  has_many :bookings

  validates :latitude, presence: true
  validates :longitude, presence: true
end
