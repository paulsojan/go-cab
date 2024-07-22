# frozen_string_literal: true

class Booking < ApplicationRecord
  enum status: { in_progress: "in_progress", completed: "complated" }, _default: :in_progress

  belongs_to :cab
  belongs_to :user

  validates :start_latitude, :end_latitude, presence: true, numericality: {
    greater_than_or_equal_to: -90,
    less_than_or_equal_to: 90
  }
  validates :start_longitude, :end_longitude, presence: true, numericality: {
    greater_than_or_equal_to: -180,
    less_than_or_equal_to: 180
  }
  validates :fare, presence: true, on: :update
  validate :can_accept_new_requests?, on: :create

  before_create :update_cab_availability

  private

    def can_accept_new_requests?
      errors.add(:base, t("cab.already_assigned")) if !self.cab.is_available
    end

    def update_cab_availability
      self.cab.update!(is_available: false)
    end
end
