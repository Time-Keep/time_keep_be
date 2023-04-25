require 'rails_helper'

RSpec.describe TomTomService do
  describe 'jewelry_estabs' do
    it 'retrieves json of the jewelry establishments by coordinates', :vcr do
      lat = '33.2896'
      lon = '-87.5251'
      expect(TomTomService.jewelry_estabs(lat,lon)).to eq(12)
    end
  end
end
