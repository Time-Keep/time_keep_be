require 'rails_helper'
require 'csv'

RSpec.describe 'County Request', :vcr do
  describe 'successful' do
    let(:state1) { State.create(
      id: 1,
      name: 'Alabama',
      abbrev: 'AL',
      unemp_rate: '3.4',
      tax_rate: '4'
      ) }
    let(:state2) { State.create(
      id: 55,
      name: 'Wisconsin',
      abbrev: 'WI',
      unemp_rate: '3.8',
      tax_rate: '5'
      ) }
    let(:county1) { County.create(
      name: 'Tuscaloosa',
      county_full: 'Tuscaloosa County',
      fips: '1125',
      lat: '33.2896',
      lon: '-87.5251',
      population: '223945',
      unemployment_rate: '3.6',
      median_income: '43,439',
      tax_rate: '0.39',
      state_id: state1.id
      ) }
    let(:county2) { County.create(
      name: 'Tuscaloosa',
      county_full: 'Jefferson County',
      fips: '1073',
      lat: '33.5543',
      lon: '-86.8964',
      population: '672550',
      unemployment_rate: '3.6',
      median_income: '62,371',
      tax_rate: '0.82',
      state_id: state1.id
      ) }
    let!(:county3) { County.create(
      name: 'Dane',
      county_full: 'Racine County',
      fips: '55101',
      lat: '42.7475',
      lon: '-88.0613',
      population: '197379',
      unemployment_rate: '4.7',
      median_income: '56,884',
      tax_rate: '6.00',
      state_id: state2.id
      ) }
    let!(:county4) { County.create(
      name: 'Dodge',
      county_full: 'Richland County',
      fips: '55103',
      lat: '43.3756',
      lon: '-90.4295',
      population: '17353',
      unemployment_rate: '3.5',
      median_income: '50,749',
      tax_rate: '6.00',
      state_id: state2.id
      ) }

      it 'sends data for county' do
        get '/api/v1/counties'

        expect(response).to be_successful
        expect(response.status).to eq(200)
      end
    end

  describe 'unsuccessful' do
    it 'sends 503 for bad request' do
      get '/api/v1/counties'

      expect(response).to_not be_successful
      expect(response.status).to eq(503)
      expect(response.body).to eq("{\"error\":\"API Rate Limit\"}")
    end
  end
end
