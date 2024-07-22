# frozen_string_literal: true

require "test_helper"

class Api::V1::BookingsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = create(:user)
    @cab_one = create(:cab, user: @user)
    @cab_two = create(:cab, cab_type: :premium, user: @user)
  end

  def test_should_create_booking
    post api_v1_bookings_path, params: booking_params
    assert_response :success
  end

  def test_reject_customer_request_when_no_cabs_available
    create(:booking, cab: @cab_one)
    create(:booking, cab: @cab_two)

    post api_v1_bookings_path, params: booking_params
    assert_response :unprocessable_entity
    assert_equal t("cab.not_available"), response_body["error"]
  end

  def test_should_complete_ride
    booking = create(:booking, cab: @cab_one)
    put api_v1_booking_path(booking.id)
    assert_response :success
    @cab_one.reload

    assert_equal true, @cab_one.is_available
    assert_equal booking.end_latitude, @cab_one.latitude
    assert_equal booking.end_longitude, @cab_one.longitude
  end

  def test_should_not_update_booking_after_ride_has_completed
    booking = create(:booking, cab: @cab_one)
    booking.update!(status: Booking.statuses[:completed], fare: 100)
    booking.cab.update!(is_available: true, latitude: booking.end_latitude, longitude: booking.end_longitude)

    put api_v1_booking_path(booking.id)
    assert_response :unprocessable_entity
    assert_equal t("booking.ride_completed"), response_body["notice"]
  end

  private

    def booking_params
      {
        booking: {
          start_latitude: 10.0217806, start_longitude: 76.3693712, end_latitude: 9.0217806,
          end_longitude: 76.1233712, cab_type: "regular"
        }
      }
    end
end
