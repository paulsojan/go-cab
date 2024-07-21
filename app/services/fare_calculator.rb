# frozen_string_literal: true

class FareCalculator
  attr_reader :booking

  def initialize(booking)
    @booking = booking
  end

  def process
    get_booking_fare
  end

  private

    def get_booking_fare
      cab_type = booking.cab.cab_type
      distance = calculate_distance.round(2)
      if cab_type == "regular"
        distance * 12
      else
        distance * 18
      end
    end

    def calculate_distance
      delta_lat = booking.end_latitude - booking.start_latitude
      delta_long = booking.end_longitude - booking.start_longitude

      # Convert latitude difference to kilometers
      delta_lat_km = delta_lat * 111
      avg_lat = (booking.start_latitude + booking.end_latitude) / 2

      # Convert longitude difference to kilometers
      delta_long_km = delta_long * (111 * Math.cos(avg_lat * Math::PI / 180))
      distance_formula(delta_lat_km, delta_long_km)
    end

    def distance_formula(delta_lat_km, delta_long_km)
      Math.sqrt(delta_lat_km**2 + delta_long_km**2)
    end
end
