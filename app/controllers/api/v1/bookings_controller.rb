# frozen_string_literal: true

class Api::V1::BookingsController < Api::V1::BaseController
  before_action :load_booking!, only: :update

  def create
    @cab = NearbyCabFinder.new(booking_params).process

    if @cab.blank?
      render_error(t("cab.not_available"), :not_found)
    else
      booking = current_user.bookings.create!(booking_params.merge(cab: @cab).except(:cab_type))
      render_json({ cab: @cab, booking_id: booking.id })
    end
  end

  def update
    if @booking.status == Booking.statuses[:in_progress]
      fare = FareCalculator.new(@booking).process
      @booking.update!(status: Booking.statuses[:completed], fare:)
      @booking.cab.update!(is_available: true, latitude: @booking.end_latitude, longitude: @booking.end_longitude)
      render_json({ fare: })
    else
      render_message("Ride has already been completed.")
    end
  end

  private

    def booking_params
      params.require(:booking).permit(
        :start_latitude, :start_longitude, :end_latitude, :end_longitude, :fare,
        :cab_type)
    end

    def load_booking!
      @booking = Booking.find(params[:id])
    end
end
