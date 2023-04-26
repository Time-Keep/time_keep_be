class EstablishmentFacade
  def self.estab_count(lat, lon)
    TomTomService.jewelry_estabs(lat,lon)[:summary][:totalResults]
  end

  def self.estab_count2(lat, lon)
    TomTomService.jewelry_estabs2(lat,lon)[:summary][:totalResults]
  end

  def self.industry_stats
    @industry_data = CensusService.industry_stats
    industry_details
  end

  def self.industry_details
    headers = [@industry_data[0]]
    attrs = @industry_data[1..]

    stats = attrs.map(&headers.first.method(:zip))
    .map(&:to_h)
    .map(&:symbolize_keys)
  end
end
