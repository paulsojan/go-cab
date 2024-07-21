# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[6.0]
  def self.up
    create_table :users, id: :uuid do |t|
      t.string :email, null: false, default: ""
      t.string :first_name
      t.string :last_name
      t.string :password_digest, null: false

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
