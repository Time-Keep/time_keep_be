class EstablishmentFacade
  def self.estab_count(lat, lon)
    TomTomService.jewelry_estabs(lat,lon)[:summary][:totalResults]
  end

  def self.estab_count2(lat, lon)
    TomTomService.jewelry_estabs2(lat,lon)[:summary][:totalResults]
  end
end
