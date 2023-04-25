require 'rails_helper'

RSpec.describe "TOMTOM Service" do
  describe "jewelry_estabs" do
    it "returns json of the jewelry establishments for a county full name", :vcr do
      lat = "33.2896"
      lon = "-87.5251"

      expect(TomTomService.jewelry_estabs(lat,lon)).to eq(12)
    end
  end
end
