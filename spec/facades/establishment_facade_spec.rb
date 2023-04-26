require 'rails_helper'

RSpec.describe EstablishmentFacade, :vcr do
  it 'returns number of jewelry retail stores for coordinates' do
    lat = '33.2896'
    lon = '-87.5251'
    stores = EstablishmentFacade.estab_count(lat, lon)
    stores2 = EstablishmentFacade.estab_count2(lat, lon)

    expect(stores).to eq(12)
    expect(stores2).to eq(12)
  end
end
