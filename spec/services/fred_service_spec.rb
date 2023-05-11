require 'rails_helper'

RSpec.describe FredService, :vcr do
  describe 'counties_unemployment' do
    it 'returns unemployment rates for all counties' do
      date_format = '2022-01-01'
      response = FredService.counties_unemployment(date_format)

      expect(response).to be_a Hash
      expect(response.keys).to eq(
        [
          :title,
          :region,
          :seasonality,
          :units,
          :frequency,
          :data
          ])
      expect(response[:title]).to eq('2023 March Unemployment Rate by County (Percent)')
      expect(response[:title]).to include('Unemployment Rate by County (Percent)')
      expect(response[:region]).to eq('county')
      expect(response[:seasonality]).to eq('Not Seasonally Adjusted')
      expect(response[:units]).to eq('Percent')
      expect(response[:frequency]).to eq('Monthly')
      expect(response[:data]).to be_a Hash
      expect(response[:data].keys).to eq([:"#{date_format}"])
      expect(response[:data][:"#{date_format}"]).to be_an Array
      expect(response[:data][:"#{date_format}"].count).to eq 3139 # 3143 counties in US
      response[:data][:"#{date_format}"].each do |result|
        expect(result).to be_a Hash
        expect(result.keys).to eq([:region, :code, :value, :series_id])
        expect(result[:region]).to be_a String
        expect(result[:code]).to be_a String
        expect(result[:code].to_i).to be_an Integer
        expect(result[:value]).to be_a Numeric
        expect(result[:series_id]).to be_a String
      end
    end
  end
end
