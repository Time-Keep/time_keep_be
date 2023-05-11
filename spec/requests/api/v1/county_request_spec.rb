require 'rails_helper'
require 'csv'

RSpec.describe 'County Request', :vcr do
  describe 'successful' do
      let!(:county1) { County.create!(county: 'Tuscaloosa',
                                county_ascii: 'Tuscaloosa',
                                county_full: 'Tuscaloosa County',
                                county_fips: '1125',
                                state_id: 'AL',
                                state_name: 'Alabama',
                                lat: '33.2896',
                                lon: '-87.5251',
                                population: '223945',
                                county_unemployment_rate: '3.6',
                                state_unemployment: '3.4',
                                county_median_income: '43,439',
                                tax_rate: '0.39') }

      let!(:county2) { County.create!(county: "Dane",
                                  county_ascii: "Dane",
                                  county_full: "Racine County",
                                  county_fips: "55101",
                                  state_id: "WI",
                                  state_name: "Wisconsin",
                                  lat: "42.7475",
                                  lon: "-88.0613",
                                  population: "197379",
                                  county_unemployment_rate: "4.7",
                                  state_unemployment: "3.8",
                                  county_median_income: "56,884",
                                  tax_rate: "6.00") }

      let!(:county3) { County.create!(county: "Dodge",
                                  county_ascii: "Dodge",
                                  county_full: "Richland County",
                                  county_fips: "55103",
                                  state_id: "WI",
                                  state_name: "Wisconsin",
                                  lat: "43.3756",
                                  lon: "-90.4295",
                                  population: "17353",
                                  county_unemployment_rate: "3.5",
                                  state_unemployment: "3.8",
                                  county_median_income: "50,749",
                                  tax_rate: "6.00") }

      it 'sends data for county' do
        get '/api/v1/county'

        expect(response).to be_successful
        expect(response.status).to eq(200)
      end
    end

  describe 'unsuccessful' do
      it 'sends 503 for bad request' do
        get '/api/v1/county'

        expect(response).to_not be_successful
        expect(response.status).to eq(503)
        expect(response.body).to eq("{\"error\":\"API Rate Limit\"}")
      end
  end
end
