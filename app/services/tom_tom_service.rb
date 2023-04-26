class TomTomService
  def self.jewelry_estabs(lat,lon)
    response = conn.get('/search/2/nearbySearch/.json?') do |faraday|
      faraday.params['country'] = 'US'
      faraday.params['categorySet'] = '9361036'
      faraday.params['lat'] = "#{lat}"
      faraday.params['lon'] = "#{lon}"
      faraday.params['key'] = ENV['tom_tom_api_key']
    end
    parse(response)
  end

  def self.jewelry_estabs2(lat,lon)
    response = conn.get('/search/2/nearbySearch/.json?') do |faraday|
      faraday.params['country'] = 'US'
      faraday.params['categorySet'] = '9361036'
      faraday.params['lat'] = "#{lat}"
      faraday.params['lon'] = "#{lon}"
      faraday.params['key'] = ENV['tom_tom_api_key_2']
    end
    parse(response)
  end

  def self.conn
    Faraday.new('https://api.tomtom.com')
  end

  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
