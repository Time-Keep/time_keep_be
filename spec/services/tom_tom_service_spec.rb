require 'rails_helper'

RSpec.describe TomTomService, :vcr do
  describe 'jewelry_estabs' do
    it 'returns jewelry establishments for coordinates' do
      lat = '33.2896'
      lon = '-87.5251'
      response = TomTomService.jewelry_estabs(lat, lon)

      expect(response.keys).to eq([:summary, :results])
      expect(response[:summary]).to have_key(:totalResults)
      expect(response[:summary][:totalResults]).to eq(12)
    end
  end
end
