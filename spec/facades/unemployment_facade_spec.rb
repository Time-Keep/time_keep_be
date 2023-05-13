require 'rails_helper'

RSpec.describe UnemploymentFacade, :vcr do
  let(:date_format) { Date.today.strftime('%F') }

  describe 'all_states' do
    it 'returns most recently reported unemployment rates' do
      rates = UnemploymentFacade.all_states(date_format)

      expect(rates).to be_an Array
      rates.each do |rate|
        expect(rate.keys).to eq([:name, :unemp_rate])
        expect(rate[:name]).to be_a String
        expect(rate[:unemp_rate].to_f).to be_a Float
      end
    end
  end

  describe 'all_counties' do
    it 'returns most recently reported unemployment rates' do
      rates = UnemploymentFacade.all_counties(date_format)

      expect(rates).to be_an Array
      rates.each do |rate|
        expect(rate.keys).to eq([:county_full, :fips, :unemployment_rate])
        expect(rate[:county_full]).to be_a String
        expect(rate[:fips]).to be_a String
        expect(rate[:fips].size).to eq 5
        expect(rate[:unemployment_rate].to_f).to be_a Float
      end
    end
  end
end
