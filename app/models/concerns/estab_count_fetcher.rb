module EstabCountFetcher
  def self.fetch_count(lat, lon)
    EstablishmentFacade.estab_count(lat, lon)
  end

  def self.fetch_count2(lat, lon)
    EstablishmentFacade.estab_count2(lat, lon)
  end
end
