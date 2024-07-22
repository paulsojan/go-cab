# frozen_string_literal: true

module SampleData
  class LoadersList
    def process!
      SampleData::BuildUser.new.process!
      SampleData::PopulateSampleCabs.new.process!
    end
  end
end
