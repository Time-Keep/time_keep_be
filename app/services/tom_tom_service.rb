class TomTomService
  def self.jewelry_estabs(lat,lon)
    response = conn.get('/search/2/nearbySearch/.json?') do |faraday|
      faraday.params['country'] = 'US'
      faraday.params['categorySet'] = '9361036'
      faraday.params['lat'] = "#{lat}"
      faraday.params['lon'] = "#{lon}"
    end
    parse(response)
  end

  def self.jewelry_estabs2(lat,lon)
    response = conn2.get('/search/2/nearbySearch/.json?') do |faraday|
      faraday.params['country'] = 'US'
      faraday.params['categorySet'] = '9361036'
      faraday.params['lat'] = "#{lat}"
      faraday.params['lon'] = "#{lon}"
    end
    parse(response)
  end


  def self.conn2
    Faraday.new(url: 'https://api.tomtom.com', params: { key: ENV['tom_tom_api_key_2'] })
  end

  def self.conn
    Faraday.new(url: 'https://api.tomtom.com', params: { key: ENV['tom_tom_api_key'] })
  end

  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
