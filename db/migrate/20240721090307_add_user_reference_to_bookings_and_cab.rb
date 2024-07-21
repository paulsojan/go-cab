# frozen_string_literal: true

class AddUserReferenceToBookingsAndCab < ActiveRecord::Migration[7.0]
  def change
    add_reference :bookings, :user, type: :uuid, foreign_key: true, null: false
    add_reference :cabs, :user, type: :uuid, foreign_key: true, null: false
  end
end
