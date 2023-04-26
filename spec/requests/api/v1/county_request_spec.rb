require 'rails_helper'
require 'csv'

RSpec.describe 'County Request', :vcr do

    let!(:county) { County.create!(county: 'Tuscaloosa',
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

    it 'sends data for county' do
        get '/api/v1/county'
        
        expect(response).to be_successful
    end
end
