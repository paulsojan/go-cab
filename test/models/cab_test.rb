# frozen_string_literal: true

require "test_helper"

class CabTest < ActiveSupport::TestCase
  def setup
    @cab = create(:cab)
  end

  def test_cab_should_not_be_valid_without_title
    @cab.title = ""
    assert_not @cab.valid?
    assert_includes @cab.errors.full_messages.to_sentence, t("cab.not_blank", field: "Title")
  end

  def test_cab_should_not_be_valid_without_longitude
    @cab.longitude = ""
    assert_not @cab.valid?
    assert_includes @cab.errors.full_messages.to_sentence, t("cab.not_blank", field: "Longitude")
  end

  def test_cab_should_not_be_valid_without_latitude
    @cab.latitude = ""
    assert_not @cab.valid?
    assert_includes @cab.errors.full_messages.to_sentence, t("cab.not_blank", field: "Latitude")
  end

  def test_cab_longitude_should_be_vaild
    @cab.longitude = 200.0217806
    assert_not @cab.valid?
    assert_includes @cab.errors.full_messages.to_sentence, t("cab.invalid_longitude")
  end

  def test_cab_latitude_should_be_vaild
    @cab.latitude = 180.0217806
    assert_not @cab.valid?
    assert_includes @cab.errors.full_messages.to_sentence, t("cab.invalid_latitude")
  end

  def test_cab_should_not_be_valid_without_user
    @cab.user = nil
    assert_not @cab.save
    assert_includes t("must_exists", entity: "User"), @cab.errors.full_messages.to_sentence
  end
end
