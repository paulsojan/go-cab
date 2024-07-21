# frozen_string_literal: true

class AddTitleToCabs < ActiveRecord::Migration[7.0]
  def change
    add_column :cabs, :title, :string, null: false
  end
end
