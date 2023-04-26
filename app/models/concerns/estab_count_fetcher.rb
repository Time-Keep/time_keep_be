module EstabCountFetcher
  def self.fetch_count(lat, lon)
    EstablishmentFacade.estab_count(lat, lon)
  end
end
