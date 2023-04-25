class TomTomService
  def self.conn
    Faraday.new('https://api.tomtom.com')
  end

  def self.jewelry_estabs(lat,lon)
    response = conn.get("/search/2/nearbySearch/.json?&key=#{ENV['tom_tom_api_key']}&country=US&categorySet=9361036&lat=#{lat}&lon=#{lon}")
    json = JSON.parse(response.body, symbolize_names: true)
    json[:summary][:totalResults]
  end
end
