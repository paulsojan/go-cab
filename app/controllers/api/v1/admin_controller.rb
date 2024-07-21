# frozen_string_literal: true

class Api::V1::AdminController < Api::V1::BaseController
  def index
    @cabs = current_user.cabs
    @bookings = current_user.bookings
    @total_trips = @bookings.completed
    @total_fare_earned = @total_trips.pluck(:fare).inject(&:+)
  end
end
