class CensusService
  def self.industry_stats
    response = conn.get('/data/2017/ecnbasic?') do |faraday|
      faraday.params['get'] = 'NAICS2017_LABEL,PAYANPW,ESTAB,NAME'
      faraday.params['for'] = 'state:*'
      faraday.params['NAICS2017'] = '339910'
    end
    parse(response)
  end

  def self.conn
    Faraday.new(url: 'https://api.census.gov', params: { key: ENV['CENSUS_KEY'] })
  end

  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
