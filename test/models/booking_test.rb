# frozen_string_literal: true

require "test_helper"

class BookingTest < ActiveSupport::TestCase
  def setup
    @cab = create(:cab)
    @booking = create(:booking, cab: @cab)
  end

  def test_booking_should_not_be_valid_without_start_longitude_and_start_latitude
    @booking.start_latitude = ""
    @booking.start_longitude = ""
    assert_not @booking.valid?
    assert_includes @booking.errors.full_messages.to_sentence, t("booking.not_blank", field: "Start latitude")
    assert_includes @booking.errors.full_messages.to_sentence, t("booking.not_blank", field: "Start longitude")
  end

  def test_booking_should_not_be_valid_without_end_longitude_and_end_latitude
    @booking.end_latitude = ""
    @booking.end_longitude = ""
    assert_not @booking.valid?
    assert_includes @booking.errors.full_messages.to_sentence, t("booking.not_blank", field: "End latitude")
    assert_includes @booking.errors.full_messages.to_sentence, t("booking.not_blank", field: "End longitude")
  end

  def test_should_not_accept_booking_for_already_assigned_cab
    booking = build(:booking, cab: @cab)
    assert_not booking.valid?
    assert_equal t("cab.already_assigned"), booking.errors.full_messages.to_sentence
  end

  def test_should_update_cab_availablity_upon_booking
    cab = create(:cab)
    create(:booking, cab:)

    assert_equal false, cab.is_available
  end

  def test_booking_should_not_be_valid_without_user
    @booking.user = nil
    assert_not @booking.save
    assert_includes @booking.errors.full_messages.to_sentence, t("must_exists", entity: "User")
  end

  def test_booking_should_not_be_valid_without_cab
    @booking.cab = nil
    assert_not @booking.save
    assert_includes @booking.errors.full_messages.to_sentence, t("must_exists", entity: "Cab")
  end
end
