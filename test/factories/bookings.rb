# frozen_string_literal: true

FactoryBot.define do
  factory :booking do
    user
    start_latitude { Faker::Address.latitude }
    start_longitude { Faker::Address.longitude }
    end_latitude { Faker::Address.latitude }
    end_longitude { Faker::Address.longitude }
    status { :in_progress }
  end
end
