class EstablishmentFacade
  def self.estab_count(lat, lon)
    TomTomService.jewelry_estabs(lat,lon)[:summary][:totalResults]
  end

  def self.estab_count2(lat, lon)
    TomTomService.jewelry_estabs2(lat,lon)[:summary][:totalResults]
  end

  def self.industry_stats
    service = CensusService.industry_stats
    detail_converter(service).map do |detail|
      data = OpenStruct.new({
        id: nil,
        type: detail[:NAICS2017_LABEL],
        attributes: {
          state: detail[:NAME].split(', ').last,
          ST_FIP: detail[:state],
          county: detail[:NAME].split(', ').first,
          FIP: detail[:county],
          NAICS2017_code: detail[:NAICS2017],
          employee_count: detail[:EMP].to_i,
          average_industry_wage: (detail[:PAYANN].to_i * 1000) / detail[:EMP].to_i,
          establishment_count: detail[:ESTAB].to_i
        }})
    end
  end

  def self.county_stats(fip, st_fip)
    service = CensusService.county_stats(fip, st_fip)
    detail = detail_converter(service)[0]
      data = OpenStruct.new({
        id: nil,
        type: 'industry_stats',
        attributes: {
          state:
          detail[:NAME].include?(', ') ? detail[:NAME].split(', ').last : detail[:STABREV],
          st_abbrev: detail[:STABREV],
          ST_FIP: detail[:state],
          county: detail[:NAME].split(', ').first,
          FIP: detail[:county],
          median_income: detail[:SAEMHI_PT],
          unemployment_rate: detail[:S0102_C02_070M],
          industry: detail[:NAICS2017_LABEL] || '',
          NAICS2017_code: detail[:NAICS2017] || '',
          employee_count: detail[:EMP].to_i || 0,
          average_industry_wage:
          detail[:PAYANN].present? ? (detail[:PAYANN].to_i * 1000) / detail[:EMP].to_i : 0,
          establishment_count: detail[:ESTAB].to_i || 0
        }})

  end

  def self.detail_converter(service)
    headers = [service[0]]
    attrs = service[1..]
    conversion = attrs.map(&headers.first.method(:zip))
    .map(&:to_h)
    .map(&:symbolize_keys)
    replace_nil(conversion)
  end

  def self.replace_nil(arg)
    arg.map { |h| h.transform_values { |value| value.nil? ? 'Not yet reported' : value } }
  end
end
