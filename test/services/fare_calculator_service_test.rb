# frozen_string_literal: true

require "test_helper"

class FareCalculatorServiceTest < ActiveSupport::TestCase
  def setup
    @cab = create(:cab)
    @booking = create(
      :booking, start_latitude: 10.0211323, start_longitude: 76.3187138, end_latitude: 9.2662979,
      end_longitude: 76.7974497, cab: @cab)
  end

  def test_fare_calculator_service_should_calculate_the_ride_fare
    fare_from_service = fare_calculator(@booking).process
    assert_equal 1185.84, fare_from_service
  end

  private

    def fare_calculator(booking)
      FareCalculatorService.new(booking)
    end
end
