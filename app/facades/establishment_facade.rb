class EstablishmentFacade
  def self.estab_count(lat, lon)
    TomTomService.jewelry_estabs(lat,lon)[:summary][:totalResults]
  end
end
