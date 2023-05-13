class FredService
  def self.counties_unemployment(date_format)
    response = conn.get('/geofred/regional/data?') do |faraday|
      faraday.params['series_group'] = '1224'
      faraday.params['date'] = "#{date_format}"
      faraday.params['region_type'] = 'county'
      faraday.params['units'] = 'Percent'
      faraday.params['frequency'] = 'm'
      faraday.params['season'] = 'NSA'
      faraday.params['file_type'] = 'json'
    end
    parse(response)
  end

  def self.states_unemployment(date_format)
    response = conn.get('/geofred/regional/data?') do |faraday|
      faraday.params['series_group'] = '1224'
      faraday.params['date'] = "#{date_format}"
      faraday.params['region_type'] = 'state'
      faraday.params['units'] = 'Percent'
      faraday.params['frequency'] = 'm'
      faraday.params['season'] = 'SA'
      faraday.params['file_type'] = 'json'
    end
    parse(response)
  end

  def self.conn
    Faraday.new(url: 'https://api.stlouisfed.org', params: { api_key: ENV['FRED_KEY'] })
  end

  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)[:meta]
  end
end

# https://api.stlouisfed.org/geofred/regional/data?api_key=df56fba218231df28172d670bd3144f2&series_group=1224&date=2022-01-01&region_type=state&units=Percent&frequency=m&season=SA
