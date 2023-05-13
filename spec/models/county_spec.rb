require 'rails_helper'
require 'csv'

RSpec.describe County, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:county_full) }
    it { should validate_presence_of(:fips) }
    it { should validate_presence_of(:lat) }
    it { should validate_presence_of(:lon) }
    it { should validate_presence_of(:population) }
    it { should validate_presence_of(:unemployment_rate) }
    it { should validate_presence_of(:median_income) }
    it { should validate_presence_of(:tax_rate) }
  end

  describe 'relationships' do
    it { should belong_to :state }
  end

  describe 'class methods', vcr: { record: :new_episodes } do
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

    describe '#jewelry_retailer_count' do
      it 'fetches count of establishments in the county' do

        expect{county1.jewelry_retailer_count}.to change(county1, :establishment_count).from(0).to(12)
      end
    end

    describe '#jewelry_retailer_count2' do
      it "mimics jewelry_retailer_count with a different api key" do

        expect(county1.establishment_count).to eq(0)
        expect(county1.jewelry_retailer_count2).to eq(12)
        expect(county1.establishment_count).to eq(12)
      end
    end

    describe '#county_details' do
      it 'fetches demographics for a county' do

        expect{ county1.county_details }
        .to change(county1, :median_income).from('43,439').to('56274')
        expect(county1.unemployment_rate).to eq('3.6')
        expect(county1.unemployment_rate).to_not eq('Not yet reported')
        expect(county1.annual_wages).to eq(0)
        expect{ county2.county_details }
        .to change(county2, :median_income).from('62,371').to('55210')
        .and change(county2, :establishment_count).from(0).to(5)
        .and change(county2, :annual_wages).from(0).to(51916)
        .and change(county2, :unemployment_rate).from('3.6').to('0.3')
      end
    end

    describe '#fip_format' do
      it 'adds 0s to start of county_fips if under 5 chars' do

        expect(county1.fips).to eq('1125')
        expect(county1.fip_format).to eq('01125')
      end
    end

    describe '#extract_state_id' do
      it 'parses state_id from fips' do

        expect(county1.extract_state_id).to eq('1')
        expect(county3.extract_state_id).to eq('55')
      end
    end

  end
end
