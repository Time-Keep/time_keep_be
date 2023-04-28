require 'rails_helper'

RSpec.describe EstablishmentFacade, :vcr do
  describe 'jewelry_estabs' do
    it 'returns number of jewelry retail stores for coordinates' do
      lat = '33.2896'
      lon = '-87.5251'
      stores = EstablishmentFacade.estab_count(lat, lon)

      expect(stores).to eq(12)
    end
  end

  describe 'jewelry_estabs2' do
    it 'returns number for next set of jewelry retail stores for coordinates' do
      lat = '33.2896'
      lon = '-87.5251'
      stores = EstablishmentFacade.estab_count2(lat, lon)

      expect(stores).to eq(12)
    end
  end

  describe 'industry_stats' do
    it 'returns stats for jewelry manufacturing industry'do
      stats = EstablishmentFacade.industry_stats

      expect(stats).to be_an Array
      stats.each do |statistic|
        expect(statistic).to be_an OpenStruct
        expect(statistic.id).to be_nil
        expect(statistic.type).to eq('industry_stats')
        expect(statistic.attributes).to be_a Hash
        expect(statistic.attributes.keys).to eq(
          [
            :industry,
            :NAICS2017_code,
            :state_name, :FIP,
            :average_industry_wage,
            :establishment_count
            ]
          )
        expect(statistic.attributes[:industry]).to eq('Jewelry and silverware manufacturing')
        expect(statistic.attributes[:NAICS2017_code]).to eq('339910')
        expect(statistic.attributes[:state_name]).to be_a String
        expect(statistic.attributes[:FIP].to_i).to be_an Integer
        expect(statistic.attributes[:average_industry_wage].to_i).to be_an Integer
        expect(statistic.attributes[:establishment_count]).to be_an Integer
      end
    end
  end

  describe 'industry_details' do
    it 'returns details for jewelry manufacturing industry'do
      stats = EstablishmentFacade.industry_details

      expect(stats).to be_an Array
      stats.each do |statistic|
        expect(statistic).to be_a Hash
        expect(statistic.keys).to eq([:NAICS2017_LABEL, :PAYANPW, :ESTAB, :NAME, :NAICS2017, :state])
        expect(statistic[:NAICS2017_LABEL]).to eq('Jewelry and silverware manufacturing')
        expect(statistic[:PAYANPW].to_i).to be_an Integer
        expect(statistic[:ESTAB].to_i).to be_an Integer
        expect(statistic[:NAME]).to be_a String
        expect(statistic[:NAICS2017].to_i).to eq(339910)
        expect(statistic[:state].to_i).to be_an Integer
      end
    end
  end
end
