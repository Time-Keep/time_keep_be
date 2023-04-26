require 'rails_helper'
require 'csv'

RSpec.describe County, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:county) }
    it { should validate_presence_of(:county_ascii) }
    it { should validate_presence_of(:county_full) }
    it { should validate_presence_of(:county_fips) }
    it { should validate_presence_of(:state_id) }
    it { should validate_presence_of(:state_name) }
    it { should validate_presence_of(:lat) }
    it { should validate_presence_of(:lon) }
    it { should validate_presence_of(:population) }
    it { should validate_presence_of(:county_unemployment_rate) }
    it { should validate_presence_of(:state_unemployment) }
    it { should validate_presence_of(:county_median_income) }
    it { should validate_presence_of(:tax_rate) }
  end

  describe 'class methods', vcr: { record: :new_episodes } do
    let(:county) { County.create!(county: 'Tuscaloosa',
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

    describe '#industry_estab_count' do
      it 'fetches count of establishments in the county' do

        expect(county.industry_estab_count).to eq(12)
      end
    end
  end
end
