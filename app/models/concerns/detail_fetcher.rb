module DetailFetcher
  def self.fetch_estab_count(lat, lon)
    EstablishmentFacade.estab_count(lat, lon)
  end

  def self.fetch_estab_count2(lat, lon)
    EstablishmentFacade.estab_count2(lat, lon)
  end

  def self.fetch_county_stats(fip, st_fip)
    EstablishmentFacade.county_stats(fip, st_fip).attributes
  end
end
