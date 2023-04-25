class TomTomService
  def self.conn
    Faraday.new('https://api.tomtom.com/search/2/')
  end

  def self.jewelry_estabs(county_full)
    county_split_arr = county_full.split
    rejoin_county = county_split_arr.join("+")
    response = conn.get("poiSearch/#{rejoin_county}.json?key=#{ENV['tom_tom_api_key']}&countrySet=US&categorySet=9361036")
    json = JSON.parse(response.body, symbolize_names: true)
    json[:summary][:totalResults]
  end
end
