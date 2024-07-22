# frozen_string_literal: true

class NearbyCabFinderService
  attr_reader :start_latitude, :start_longitude, :cab_type, :current_user

  def initialize(booking_params, current_user)
    @start_latitude = booking_params[:start_latitude].to_f
    @start_longitude = booking_params[:start_longitude].to_f
    @cab_type = booking_params[:cab_type]
    @current_user = current_user
  end

  def process
    get_nerby_cab
  end

  private

    def get_nerby_cab
      min_distance = Float::INFINITY
      nearest_cab = nil
      current_user.cabs.available.where(cab_type:).each do |cab|
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
