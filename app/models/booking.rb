# frozen_string_literal: true

class Booking < ApplicationRecord
  enum status: { in_progress: "in_progress", completed: "complated", rejected: "rejected" }

  belongs_to :cab

  validates :start_latitude, presence: true
  validates :start_longitude, presence: true
  validates :end_latitude, presence: true
  validates :end_longitude, presence: true
  validates :fare, presence: true
end
