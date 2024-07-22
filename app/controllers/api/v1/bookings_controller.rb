# frozen_string_literal: true

class Api::V1::BookingsController < Api::V1::BaseController
  before_action :load_booking!, only: :update

  def create
    @cab = NearbyCabFinderService.new(booking_params).process

    if @cab.blank?
      render_error(t("cab.not_available"), :unprocessable_entity)
    else
      booking = current_user.bookings.create!(booking_params.merge(cab: @cab).except(:cab_type))
      render_json({ cab: @cab, booking_id: booking.id })
    end
  end

  def update
    if @booking.status == Booking.statuses[:in_progress]
      fare = FareCalculatorService.new(@booking).process
      @booking.update!(status: Booking.statuses[:completed], fare: fare.round(2))
      @booking.cab.update!(is_available: true, latitude: @booking.end_latitude, longitude: @booking.end_longitude)
      render_json({ amount_to_pay: fare.round(2) })
    else
      render_message(t("booking.ride_completed"), :unprocessable_entity)
    end
  end

  private

    def booking_params
      params.require(:booking).permit(
        :start_latitude, :start_longitude, :end_latitude, :end_longitude,
        :cab_type)
    end

    def load_booking!
      @booking = Booking.find(params[:id])
    end
end
