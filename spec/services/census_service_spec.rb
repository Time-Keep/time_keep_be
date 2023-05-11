require 'rails_helper'

RSpec.describe CensusService, :vcr do
  describe 'industry_stats' do
    it 'returns jewelry wholesaler stats for all states' do
      response = CensusService.industry_stats

      expect(response).to be_an Array
      expect(response.first).to eq(['NAME', 'NAICS2017_LABEL', 'ESTAB', 'EMP', 'PAYANN', 'NAICS2017', 'state', 'county'])
      response[1..].each do |result|
        expect(result[0]).to be_a String
        expect(result[1]).to eq('Jewelry, watch, precious stone, and precious metal merchant wholesalers')
        expect(result[2].to_i).to be_an Integer
        expect(result[3].to_i).to be_an Integer
        expect(result[4].to_i).to be_an Integer
        expect(result[5]).to eq('423940')
        expect(result[5].to_i).to be_an Integer
        expect(result[5].to_i).to eq(423940)
        expect(result[6].to_i).to be_an Integer
        expect(result[7].to_i).to be_an Integer
      end
    end
  end

  describe 'county_stats' do
    it 'returns jewelry wholesaler stats for a county' do
      county_fips = '1073'
      fips = county_fips.rjust(5, '0')
      fip = fips[2..4]
      st_fip = fips[0..1]
      response = CensusService.county_stats(fip, st_fip)

      expect(response).to be_an Array
      expect(response[0]).to eq([
        'NAME',
        'STABREV',
        'SAEMHI_PT',
        'time',
        'state',
        'county',
        'NAME',
        'S0102_C02_070M',
        'state',
        'county',
        'NAME',
        'NAICS2017_LABEL',
        'ESTAB',
        'EMP',
        'PAYANN',
        'NAICS2017',
        'state',
        'county'
        ])
      expect(response[1]).to be_an Array
      expect(response[1][0]).to eq('Jefferson County')
      expect(response[1][1]).to eq('AL')
      expect(response[1][2].to_i).to be_an Integer
      expect(response[1][3]).to eq('2021')
      expect(response[1][4]).to eq('01')
      expect(response[1][5]).to eq('073')
      expect(response[1][6]).to eq('Jefferson County, Alabama')
      expect(response[1][7].to_f).to be_a(Float)
      expect(response[1][8].to_i).to be_an Integer
      expect(response[1][8]).to eq('01')
      expect(response[1][9].to_i).to be_an Integer
      expect(response[1][9]).to eq('073')
      expect(response[1][10]).to eq('Jefferson County, Alabama')
      expect(response[1][11]).to eq('Jewelry, watch, precious stone, and precious metal merchant wholesalers')
      expect(response[1][12].to_i).to be_an Integer
      expect(response[1][13].to_i).to be_an Integer
      expect(response[1][14].to_i).to be_an Integer
      expect(response[1][15]).to eq('423940')
      expect(response[1][16]).to eq('01')
      expect(response[1][17]).to eq('073')
    end

    it 'returns empty jewelry wholesaler stats for a county' do
      county_fips = '1125'
      fips = county_fips.rjust(5, '0')
      fip = fips[2..4]
      st_fip = fips[0..1]
      response = CensusService.county_stats(fip, st_fip)

      expect(response).to be_an Array
      expect(response[0]).to eq([
        'NAME',
        'STABREV',
        'SAEMHI_PT',
        'time',
        'state',
        'county',
        'NAME',
        'S0102_C02_070M',
        'state',
        'county'
        ])
      expect(response[1]).to be_an Array
      expect(response[1][0]).to eq('Tuscaloosa County')
      expect(response[1][1]).to eq('AL')
      expect(response[1][2].to_i).to be_an Integer
      expect(response[1][3]).to eq('2021')
      expect(response[1][4]).to eq('01')
      expect(response[1][5]).to eq('125')
      expect(response[1][6]).to eq('Tuscaloosa County, Alabama')
      expect(response[1][7]).to be_nil
      expect(response[1][8]).to eq('01')
      expect(response[1][9]).to eq('125')
    end
  end
end
