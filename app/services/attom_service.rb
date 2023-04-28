class AttomService
  def self.state_lookup
    response = conn.get('/v4/area/state/lookup')
    parse(response)
  end

  def self.conn
    Faraday.new(url: 'https://api.gateway.attomdata.com', headers: { 'accept' => 'application/json', apikey: ENV['ATTOM_KEY'] })
  end

  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
