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
    let(:counties) { County.all }
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
                              tax_rate: '0.39'
                            ) }

    describe '#industry_estab_count' do
      it 'fetches count of establishments in the county' do

        expect{county.industry_estab_count}.to change(county, :establishment_count).from(0).to(12)
      end
    end

    describe '#industry_estab_count2' do
      it "mimics industry_estab_count with a different api key" do

        expect(county.establishment_count).to eq(0)
        expect(county.industry_estab_count2).to eq(12)
        expect(county.establishment_count).to eq(12)
      end
    end

    describe '#county_details' do
      it 'fetches demographics for a county' do

        expect(county.county_details).to be_a Hash
        expect(county.county_details[:state]).to eq('Alabama')
        expect(county.county_details[:st_abbrev]).to eq('AL')
        expect(county.county_details[:ST_FIP]).to eq('01')
        expect(county.county_details[:county]).to eq('Tuscaloosa County')
        expect(county.county_details[:FIP]).to eq('125')
        expect(county.county_details[:median_income].to_i).to be_an Integer
        expect(county.county_details[:industry]).to eq('')
        expect(county.county_details[:NAICS2017_code]).to eq('')
        expect(county.county_details[:employee_count]).to eq(0)
        expect(county.county_details[:average_industry_wage]).to eq(0)
        expect(county.county_details[:establishment_count]).to eq(0)
      end
    end

    describe '#fip_format' do
      it 'adds 0s to start of county_fips if under 5 chars' do

        expect(county.county_fips).to eq('1125')
        expect(county.fip_format).to eq('01125')
      end
    end
  end
end
