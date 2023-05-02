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
    it 'returns stats for jewelry wholesaler industry'do
      stats = EstablishmentFacade.industry_stats

      expect(stats).to be_an Array
      stats.each do |statistic|
        expect(statistic).to be_an OpenStruct
        expect(statistic.id).to be_nil
        expect(statistic.type).to eq('Jewelry, watch, precious stone, and precious metal merchant wholesalers')
        expect(statistic.attributes).to be_a Hash
        expect(statistic.attributes.keys).to eq(
          [
            :state,
            :ST_FIP,
            :county,
            :FIP,
            :NAICS2017_code,
            :employee_count,
            :average_industry_wage,
            :establishment_count
            ]
          )
        expect(statistic.attributes[:state]).to be_a String
        expect(statistic.attributes[:ST_FIP].to_i).to be_an Integer
        expect(statistic.attributes[:county]).to be_a String
        expect(statistic.attributes[:FIP].to_i).to be_an Integer
        expect(statistic.attributes[:NAICS2017_code]).to eq('423940')
        expect(statistic.attributes[:employee_count]).to be_an Integer
        expect(statistic.attributes[:average_industry_wage]).to be_an Integer
        expect(statistic.attributes[:establishment_count]).to be_an Integer
      end
    end
  end

  describe 'county_stats' do
    it 'returns jewelry wholesaler stats for a county' do
      county_fips = '1073'
      fips = county_fips.rjust(5, '0')
      fip = fips[2..4]
      st_fip = fips[0..1]
      statistic = EstablishmentFacade.county_stats(fip, st_fip)

      expect(statistic).to be_an OpenStruct
      expect(statistic.id).to be_nil
      expect(statistic.type).to eq('industry_stats')
      expect(statistic.attributes).to be_a Hash
      expect(statistic.attributes.keys).to eq(
        [
          :state,
          :st_abbrev,
          :ST_FIP,
          :county,
          :FIP,
          :median_income,
          :industry,
          :NAICS2017_code,
          :employee_count,
          :average_industry_wage,
          :establishment_count
          ]
        )
      expect(statistic.attributes[:state]).to be_a String
      expect(statistic.attributes[:state]).to eq('Alabama')
      expect(statistic.attributes[:st_abbrev]).to be_a String
      expect(statistic.attributes[:st_abbrev]).to eq('AL')
      expect(statistic.attributes[:ST_FIP].to_i).to be_an Integer
      expect(statistic.attributes[:ST_FIP]).to eq('01')
      expect(statistic.attributes[:county]).to be_a String
      expect(statistic.attributes[:county]).to eq('Jefferson County')
      expect(statistic.attributes[:FIP].to_i).to be_an Integer
      expect(statistic.attributes[:FIP]).to eq('073')
      expect(statistic.attributes[:median_income].to_i).to be_an Integer
      expect(statistic.attributes[:industry]).to eq('Jewelry, watch, precious stone, and precious metal merchant wholesalers')
      expect(statistic.attributes[:NAICS2017_code]).to eq('423940')
      expect(statistic.attributes[:employee_count]).to be_an Integer
      expect(statistic.attributes[:average_industry_wage]).to be_an Integer
      expect(statistic.attributes[:establishment_count]).to be_an Integer
    end

    it 'returns stats for a county when there are no jewelry wholsalers' do
      county_fips = '1125'
      fips = county_fips.rjust(5, '0')
      fip = fips[2..4]
      st_fip = fips[0..1]
      statistic = EstablishmentFacade.county_stats(fip, st_fip)

      expect(statistic).to be_an OpenStruct
      expect(statistic.id).to be_nil
      expect(statistic.type).to eq('industry_stats')
      expect(statistic.attributes).to be_a Hash
      expect(statistic.attributes.keys).to eq(
        [
          :state,
          :st_abbrev,
          :ST_FIP,
          :county,
          :FIP,
          :median_income,
          :industry,
          :NAICS2017_code,
          :employee_count,
          :average_industry_wage,
          :establishment_count
          ]
        )
      expect(statistic.attributes[:state]).to be_a String
      expect(statistic.attributes[:state]).to eq('AL')
      expect(statistic.attributes[:st_abbrev]).to be_a String
      expect(statistic.attributes[:st_abbrev]).to eq('AL')
      expect(statistic.attributes[:ST_FIP].to_i).to be_an Integer
      expect(statistic.attributes[:ST_FIP]).to eq('01')
      expect(statistic.attributes[:county]).to be_a String
      expect(statistic.attributes[:county]).to eq('Tuscaloosa County')
      expect(statistic.attributes[:FIP].to_i).to be_an Integer
      expect(statistic.attributes[:FIP]).to eq('125')
      expect(statistic.attributes[:median_income].to_i).to be_an Integer
      expect(statistic.attributes[:industry]).to eq('')
      expect(statistic.attributes[:NAICS2017_code]).to eq('')
      expect(statistic.attributes[:employee_count]).to be_an Integer
      expect(statistic.attributes[:employee_count]).to eq(0)
      expect(statistic.attributes[:average_industry_wage]).to be_an Integer
      expect(statistic.attributes[:average_industry_wage]).to eq(0)
      expect(statistic.attributes[:establishment_count]).to be_an Integer
      expect(statistic.attributes[:establishment_count]).to eq(0)
    end
  end

  describe 'detail_converter' do
    it 'converts details for jewelry wholesaler industry'do
      service = CensusService.industry_stats
      stats = EstablishmentFacade.detail_converter(service)

      expect(stats).to be_an Array
      stats.each do |statistic|
        expect(statistic).to be_a Hash
        expect(statistic.keys).to eq([:NAME, :NAICS2017_LABEL, :ESTAB, :EMP, :PAYANN, :NAICS2017, :state, :county])
        expect(statistic[:NAME]).to be_a String
        expect(statistic[:NAICS2017_LABEL]).to eq('Jewelry, watch, precious stone, and precious metal merchant wholesalers')
        expect(statistic[:ESTAB].to_i).to be_an Integer
        expect(statistic[:EMP].to_i).to be_an Integer
        expect(statistic[:PAYANN].to_i).to be_an Integer
        expect(statistic[:NAICS2017]).to eq('423940')
        expect(statistic[:NAICS2017].to_i).to eq(423940)
        expect(statistic[:state].to_i).to be_an Integer
        expect(statistic[:county].to_i).to be_an Integer
      end
    end

    it 'converts details for a county jewelry wholesaler industry'do
      county_fips = '1073'
      fips = county_fips.rjust(5, '0')
      fip = fips[2..4]
      st_fip = fips[0..1]
      service = CensusService.county_stats(fip, st_fip)
      stats = EstablishmentFacade.detail_converter(service)

      expect(stats).to be_an Array
      stats.each do |statistic|
        expect(statistic).to be_a Hash
        expect(statistic.keys).to eq([
          :NAME,
          :STABREV,
          :SAEMHI_PT,
          :time,
          :state,
          :county,
          :NAICS2017_LABEL,
          :ESTAB,
          :EMP,
          :PAYANN,
          :NAICS2017
          ])
        expect(statistic[:NAME]).to be_a String
        expect(statistic[:NAME]).to eq('Jefferson County, Alabama')
        expect(statistic[:STABREV]).to be_a String
        expect(statistic[:STABREV]).to eq('AL')
        expect(statistic[:SAEMHI_PT].to_i).to be_an Integer
        expect(statistic[:time].to_i).to be_an Integer
        expect(statistic[:time]).to eq('2021')
        expect(statistic[:state].to_i).to be_an Integer
        expect(statistic[:state]).to eq('01')
        expect(statistic[:county].to_i).to be_an Integer
        expect(statistic[:county]).to eq('073')
        expect(statistic[:NAICS2017_LABEL]).to be_a String
        expect(statistic[:NAICS2017_LABEL]).to eq('Jewelry, watch, precious stone, and precious metal merchant wholesalers')
        expect(statistic[:ESTAB].to_i).to be_an Integer
        expect(statistic[:EMP].to_i).to be_an Integer
        expect(statistic[:PAYANN].to_i).to be_an Integer
        expect(statistic[:NAICS2017]).to eq('423940')
        expect(statistic[:NAICS2017].to_i).to eq(423940)
      end
    end

    it 'converts county details when insustry details are missing'do
      county_fips = '1125'
      fips = county_fips.rjust(5, '0')
      fip = fips[2..4]
      st_fip = fips[0..1]
      service = CensusService.county_stats(fip, st_fip)
      stats = EstablishmentFacade.detail_converter(service)

      expect(stats).to be_an Array
      stats.each do |statistic|
        expect(statistic).to be_a Hash
        expect(statistic.keys).to eq([:NAME, :STABREV, :SAEMHI_PT, :time, :state, :county])
        expect(statistic[:NAME]).to be_a String
        expect(statistic[:NAME]).to eq('Tuscaloosa County')
        expect(statistic[:STABREV]).to be_a String
        expect(statistic[:STABREV]).to eq('AL')
        expect(statistic[:SAEMHI_PT].to_i).to be_an Integer
        expect(statistic[:time].to_i).to be_an Integer
        expect(statistic[:time]).to eq('2021')
        expect(statistic[:state].to_i).to be_an Integer
        expect(statistic[:state]).to eq('01')
        expect(statistic[:county].to_i).to be_an Integer
        expect(statistic[:county]).to eq('125')
      end
    end
  end
end
