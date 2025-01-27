json.cabs @cabs do |cab|
  json.extract! cab,
    :id,
    :cab_type,
    :is_available,
    :title
  begin
    json.current_location Geocoder.search([cab.latitude, cab.longitude]).first.address
  rescue
    json.current_location "Location not available"
  end
end
json.bookings @bookings do |booking|
  json.extract! booking,
    :id,
    :start_latitude,
    :start_longitude,
    :end_latitude,
    :end_longitude,
    :fare,
    :status
end
json.total_trips @total_trips.size
json.total_fare_earned @total_fare_earned
