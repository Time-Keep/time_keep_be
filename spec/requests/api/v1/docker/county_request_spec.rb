require 'rails_helper'

RSpec.describe "Docker County Request" do
  describe "Docker index" do
    it "returns a JSON response with the counties" do

      json_data = File.read('./db/data/counties.json')
      counties = JSON.parse(json_data, symbolize_names: true)
      expected_response = {
        json: counties
      }

      get '/api/v1/docker/counties'

      expect(response).to be_successful
      expect(response).to have_http_status(200)
      expect(counties).to be_a Hash
      expect(counties[:counties]).to be_a Array
    end
  end
end
