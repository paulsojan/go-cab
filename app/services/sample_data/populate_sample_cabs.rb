# frozen_string_literal: true

module SampleData
  class PopulateSampleCabs
    attr_accessor :user

    def initialize
      @user = User.first
    end

    def process!
      populate_sample_cabs!
    end

    private

      def populate_sample_cabs!
        Cab.create!(latitude: 10.015543, longitude: 76.364387, title: Faker::Vehicle.make_and_model, user:)
        Cab.create!(
          latitude: 10.015419, longitude: 76.355847, title: Faker::Vehicle.make_and_model,
          cab_type: :premium, user:)
        Cab.create!(latitude: 10.025210, longitude: 76.308689, title: Faker::Vehicle.make_and_model, user:)
        Cab.create!(
          latitude: 10.004796, longitude: 76.313628, title: Faker::Vehicle.make_and_model,
          cab_type: :premium, user:)
        Cab.create!(latitude: 9.994548, longitude: 76.351261, title: Faker::Vehicle.make_and_model, user:)
      end
  end
end
