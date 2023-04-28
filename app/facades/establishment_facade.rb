class EstablishmentFacade
  def self.estab_count(lat, lon)
    TomTomService.jewelry_estabs(lat,lon)[:summary][:totalResults]
  end

  def self.estab_count2(lat, lon)
    TomTomService.jewelry_estabs2(lat,lon)[:summary][:totalResults]
  end

  def self.industry_stats
    @industry_data = CensusService.industry_stats
    industry_details.map do |detail|
    data = OpenStruct.new({
      id: nil,
      type: 'industry_stats',
      attributes: {
        industry: detail[:NAICS2017_LABEL],
        NAICS2017_code: detail[:NAICS2017],
        state_name: detail[:NAME],
        FIP: detail[:state],
        average_industry_wage: detail[:PAYANPW],
        establishment_count: detail[:ESTAB].to_i
      }})
    end
  end

  def self.industry_details
    headers = [@industry_data[0]]
    attrs = @industry_data[1..]

    stats = attrs.map(&headers.first.method(:zip))
    .map(&:to_h)
    .map(&:symbolize_keys)
  end
end
