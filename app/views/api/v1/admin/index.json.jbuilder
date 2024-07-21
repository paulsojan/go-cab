json.cabs @cabs do |cab|
  json.extract! cab,
    :longitude,
    :latitude,
    :cab_type,
    :is_available
end
json.bookings @bookings do |booking|
  json.extract! booking,
    :start_latitude,
    :start_longitude,
    :end_latitude,
    :end_longitude,
    :fare,
    :status
end
