require 'rails_helper'

RSpec.describe FredService, :vcr do
  let(:date_format) { Date.today.strftime('%F') }

  describe 'counties_unemployment' do
    it 'returns most recent unemployment rates for all counties' do
      response = FredService.counties_unemployment(date_format)
      year_month = response[:title][/(\S+(\s+)?){,2}/].strip
      result_date = Date.strptime(year_month, '%Y %B').strftime('%F')

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
      expect(response[:title]).to eq("#{year_month} Unemployment Rate by County (Percent)")
      expect(response[:region]).to eq('county')
      expect(response[:seasonality]).to eq('Not Seasonally Adjusted')
      expect(response[:units]).to eq('Percent')
      expect(response[:frequency]).to eq('Monthly')
      expect(response[:data]).to be_a Hash
      expect(response[:data].keys).to eq([:"#{result_date}"])
      expect(response[:data][:"#{result_date}"]).to be_an Array
      expect(response[:data][:"#{result_date}"].count).to eq 3139 # 3143 counties in US
      response[:data][:"#{result_date}"].each do |result|
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

  describe 'states_unemployment' do
    it 'returns most recent unemployment rates for all states' do
      response = FredService.states_unemployment(date_format)
      year_month = response[:title][/(\S+(\s+)?){,2}/].strip
      result_date = Date.strptime(year_month, '%Y %B').strftime('%F')

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
      expect(response[:title]).to eq("#{year_month} Unemployment Rate by State (Percent)")
      expect(response[:region]).to eq('state')
      expect(response[:seasonality]).to eq('Seasonally Adjusted')
      expect(response[:units]).to eq('Percent')
      expect(response[:frequency]).to eq('Monthly')
      expect(response[:data]).to be_a Hash
      expect(response[:data].keys).to eq([:"#{result_date}"])
      expect(response[:data][:"#{result_date}"]).to be_an Array
      expect(response[:data][:"#{result_date}"].count).to eq 51 # 51 states including DC
      response[:data][:"#{result_date}"].each do |result|
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
