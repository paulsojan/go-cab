# frozen_string_literal: true

class Api::V1::AdminController < Api::V1::BaseController
  def index
    @cabs = current_user.cabs
    @bookings = current_user.bookings
  end
end
