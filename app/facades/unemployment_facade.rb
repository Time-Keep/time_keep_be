class UnemploymentFacade
  def self.all_states(date_format)
    service = FredService.states_unemployment(date_format)
    results = service[:data][:"#{data_date(service)}"]
    .sort_by { |h| h[:code] }
    results.map do |result|
      unemp_hash = {
        name: result[:region],
        unemp_rate: result[:value].to_s
      }
    end
  end

  def self.all_counties(date_format)
    service = FredService.counties_unemployment(date_format)
    results = service[:data][:"#{data_date(service)}"]
    .sort_by { |h| h[:code] }
    results.map do |result|
      unemp_hash = {
        county_full: result[:region].split(', ').first,
        fips: result[:code],
        unemployment_rate: result[:value].to_s
      }
    end
  end

  def self.data_date(service)
    year_month = service[:title][/(\S+(\s+)?){,2}/].strip
    Date.strptime(year_month, '%Y %B').strftime('%F')
  end
end
