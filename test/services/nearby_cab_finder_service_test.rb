# frozen_string_literal: true

require "test_helper"

class NearbyCabFinderServiceTest < ActiveSupport::TestCase
  def setup
    @cab_one = create(:cab, longitude: 10.0244029, latitude: 76.3108458, cab_type: :premium)
    @cab_two = create(:cab, longitude: 10.0244944, latitude: 76.3076186)
    @cab_three = create(:cab, longitude: 10.0217645, latitude: 76.3710433)
  end

  def test_should_find_nearby_cab
    booking_details = {
      start_longitude: 10.0188256,
      start_latitude: 76.3523507,
      cab_type: "regular"
    }
    nearby_cab_from_service = nearby_cab(booking_details).process
    assert_equal @cab_three.id, nearby_cab_from_service.id
  end

  def test_should_return_empty_when_no_cabs_are_available
    @cab_one.update!(is_available: false)
    @cab_two.update!(is_available: false)
    @cab_three.update!(is_available: false)

    booking_details = {
      start_longitude: 10.0188256,
      start_latitude: 76.3523507,
      cab_type: "regular"
    }

    nearby_cab_from_service = nearby_cab(booking_details).process
    assert_nil nearby_cab_from_service
  end

  private

    def nearby_cab(booking_details)
      NearbyCabFinderService.new(booking_details)
    end
end
