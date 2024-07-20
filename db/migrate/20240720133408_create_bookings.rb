# frozen_string_literal: true

class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings, id: :uuid do |t|
      t.float :start_latitude, null: false
      t.float :start_longitude, null: false
      t.float :end_latitude, null: false
      t.float :end_longitude, null: false
      t.float :fare, null: false
      t.string :status, null: false
      t.references :cab, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
