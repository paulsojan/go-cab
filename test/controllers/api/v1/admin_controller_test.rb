# frozen_string_literal: true

require "test_helper"

class Api::V1::AdminControllerTest < ActionDispatch::IntegrationTest
  def setup
    user = create(:user)
    @cab_one = create(:cab, user:)
    @cab_two = create(:cab, user:)
    @booking_one = create(:booking, cab: @cab_one, user:)
    @booking_two = create(:booking, cab: @cab_two, user:)
  end

  def test_should_list_details_of_the_company
    get api_v1_admin_index_path
    assert_response :success

    response_cabs = response_body["cabs"]
    response_booking = response_body["bookings"]
    assert_equal Cab.pluck(:id).sort, response_cabs.pluck("id").sort
    assert_equal Booking.pluck(:id).sort, response_booking.pluck("id").sort
  end
end
