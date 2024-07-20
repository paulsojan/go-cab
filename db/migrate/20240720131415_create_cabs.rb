# frozen_string_literal: true

class CreateCabs < ActiveRecord::Migration[7.0]
  def change
    create_table :cabs, id: :uuid do |t|
      t.float :longitude, null: false
      t.float :latitude, null: false
      t.string :cab_type, default: "regular", null: false
      t.boolean :is_available, default: true, null: false

      t.timestamps
    end
  end
end
