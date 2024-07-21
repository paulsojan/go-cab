# frozen_string_literal: true

class NearbyCabFinder
  attr_reader :start_latitude, :start_longitude, :cab_type

  def initialize(booking_params)
    @start_latitude = booking_params[:start_latitude]
    @start_longitude = booking_params[:start_longitude]
    @cab_type = booking_params[:cab_type]
  end

  def process
    get_nerby_cab
  end

  private

    def get_nerby_cab
      min_distance = Float::INFINITY
      nearest_cab = nil
      Cab.available.where(cab_type:).each do |cab|
        distance = calculate_distance(cab.latitude, cab.longitude)
        if distance < min_distance
          min_distance = distance
          nearest_cab = cab
        end
      end
      nearest_cab
    end

    def calculate_distance(cab_latitude, cab_longitude)
      Math.sqrt((cab_latitude - start_latitude)**2 + (cab_longitude - start_longitude)**2)
    end
end
