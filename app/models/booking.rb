# frozen_string_literal: true

class Booking < ApplicationRecord
  enum status: { in_progress: "in_progress", completed: "complated" }, _default: :in_progress

  belongs_to :cab

  validates :start_latitude, presence: true
  validates :start_longitude, presence: true
  validates :end_latitude, presence: true
  validates :end_longitude, presence: true
  validates :fare, presence: true
  validate :can_accept_new_requests?, on: :create

  before_create :update_cab_availability

  private

    def can_accept_new_requests?
      errors.add(t("cab.already_assigned")) if !self.cab.is_available
    end

    def update_cab_availability
      self.cab.update!(is_available: false)
    end
end
