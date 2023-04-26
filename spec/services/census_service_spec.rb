require 'rails_helper'

RSpec.describe CensusService, :vcr do
  describe 'industry_stats' do
    it 'returns jewelry establishments for all states' do
      response = CensusService.industry_stats

      expect(response).to be_an Array
      expect(response.first).to eq(['NAICS2017_LABEL', 'PAYANPW', 'ESTAB', 'NAME', 'NAICS2017', 'state'])
      response[1..].each do |result|
        expect(result[0]).to eq('Jewelry and silverware manufacturing')
        expect(result[1].to_i).to be_an Integer
        expect(result[2].to_i).to be_an Integer
        expect(result[3]).to be_a String
        expect(result[4].to_i).to be_an Integer
        expect(result[5].to_i).to be_an Integer
      end
    end
  end
end
