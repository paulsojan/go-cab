# frozen_string_literal: true

class Cab < ApplicationRecord
  scope :available, -> { where(is_available: true) }

  enum cab_type: { regular: "regular", premium: "premium" }, _default: :regular

  has_many :bookings

  belongs_to :user

  validates :latitude, presence: true, numericality: {
    greater_than_or_equal_to: -90,
    less_than_or_equal_to: 90
  }
  validates :longitude, presence: true, numericality: {
    greater_than_or_equal_to: -180,
    less_than_or_equal_to: 180
  }
  validates :title, presence: true
end
