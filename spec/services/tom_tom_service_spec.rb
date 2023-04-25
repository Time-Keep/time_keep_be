require 'rails_helper'

RSpec.describe "TOMTOM Service" do
  describe "jewelry_estabs" do
    it "returns json of the jewelry establishments for a county full name", :vcr do
      county_full = "Autauga County"

      expect(TomTomService.jewelry_estabs(county_full)).to eq(7)
    end
  end
end
