require 'rails_helper'

RSpec.describe AttomService, :vcr do
  describe 'state_lookup' do
    it 'returns geo data for all states' do
      response = AttomService.state_lookup

      expect(response).to be_a Hash
    end
  end
end
