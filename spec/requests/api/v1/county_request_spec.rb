require 'rails_helper'
require 'csv'

RSpec.describe 'County Request' do

    it 'sends data for county', :vcr do
        get '/api/v1/county'
        
        expect(response).to be_successful
    end
end