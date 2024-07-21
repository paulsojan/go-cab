# frozen_string_literal: true

class Api::V1::BookingsController < Api::V1::BaseController
  before_action :load_booking!, only: :update

  def create
    @cab = NearbyCabFinder.new(booking_params).process

    if @cab.blank?
      render_error(t("cab.not_available"), :not_found)
    else
      @cab.bookings.create!(booking_params.except(:cab_type))
      render_json(@cab)
    end
  end

  def update
    render_message("Successfuly updated")
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
