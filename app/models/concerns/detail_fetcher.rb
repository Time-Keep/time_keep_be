module DetailFetcher
  def self.fetch_retailer_count(lat, lon)
    DemographicFacade.retailer_count(lat, lon)
  end

  def self.fetch_retailer_count2(lat, lon)
    DemographicFacade.retailer_count2(lat, lon)
  end

  def self.fetch_county_stats(fip, st_fip)
    DemographicFacade.county_stats(fip, st_fip).attributes
  end
end
