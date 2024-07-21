# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  has_many :bookings
  has_many :cabs

  validates :email, uniqueness: true
  validates :first_name, :last_name, :email, presence: true
end
