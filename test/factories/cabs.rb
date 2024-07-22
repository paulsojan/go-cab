# frozen_string_literal: true

FactoryBot.define do
  factory :cab do
    user
    title { Faker::Lorem.word }
    longitude { Faker::Address.longitude }
    latitude { Faker::Address.latitude }
  end
end
