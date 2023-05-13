class CensusService
  def self.industry_stats
    response = conn.get('/data/2021/cbp?') do |faraday|
      faraday.params['get'] = 'NAME,NAICS2017_LABEL,ESTAB,EMP,PAYANN'
      faraday.params['for'] = 'county:*'
      faraday.params['in'] = 'state:*'
      faraday.params['NAICS2017'] = '423940'
    end
    parse(response)
  end

  def self.county_stats(fip, st_fip)
    response = conn.get('/data/timeseries/poverty/saipe?') do |f|
      f.params['get'] = 'NAME,STABREV,SAEMHI_PT'
      f.params['time'] = '2021'
      f.params['for'] = "county:#{fip}"
      f.params['in'] = "state:#{st_fip}"
    end
    response2 = conn.get('/data/2021/acs/acs1/subject?') do |f|
      f.params['get'] = 'NAME,S0102_C02_070M'
      f.params['for'] = "county:#{fip}"
      f.params['in'] = "state:#{st_fip}"
    end
    response3 = conn.get('/data/2021/cbp?') do |f|
      f.params['get'] = 'NAME,NAICS2017_LABEL,ESTAB,EMP,PAYANN'
      f.params['for'] = "county:#{fip}"
      f.params['in'] = "state:#{st_fip}"
      f.params['NAICS2017'] = '423940'
    end
    (parse(response) + parse(response2) + parse(response3))
    .partition.with_index { |_, i| i.even? }
    .map(&:flatten)
  end

  def self.conn
    Faraday.new(url: 'https://api.census.gov', params: { key: ENV['CENSUS_KEY'] })
  end

  def self.parse(response)
    response.body == '' ? [] : JSON.parse(response.body, symbolize_names: true)
  end
end

# https://geoenrich.arcgis.com/arcgis/rest/services/World/GeoEnrichmentServer/StandardGeographyQuery
# https://geoenrich.arcgis.com/arcgis/rest/services/World/geoenrichmentserver/StandardGeographyQuery?sourcecountry=US&optionalcountryhierarchy=census&geographylayers=["US.States"]&geographyids=["06"]&returnGeometry=true&f=json
# https://geoenrich.arcgis.com/arcgis/rest/services/World/geoenrichmentserver/StandardGeographyQuery?sourcecountry=US&optionalcountryhierarchy=census&geographylayers=["US.Counties"]&geographyQuery=orange&returnGeometry=true&f=json
# https://geoenrich.arcgis.com/arcgis/rest/services/World/GeoEnrichmentServer/Geoenrichment/Enrich?studyareas=[{"geometry":{"x":-122.435,"y":37.785}}]&f=pjson&analysisVariables=["industry.ACSINDINFO,businesses.N06_BUS,employees.N06_EMP,EmploymentUnemployment.UNEMPRT_CY,businesses.S04_BUS,Health.MEDHINC_CY"]&token=
# businesses.N06_BUS,Health.MEDHINC_CY,employees.N06_EMP,EmploymentUnemployment.UNEMPRT_CY,industrybynaicscode.N06_SALES,householdincome.PCI_CY,industry.ACSINDMANU
# businesses.N06_BUS,Health.MEDHINC_CY,employees.N06_EMP,EmploymentUnemployment.UNEMPRT_CY,industrybynaicscode.N06_SALES,householdincome.PCI_CY,industry.ACSINDMANU,industry.INDMANU_CY,householdincome.HINCBASECY,householdincome.AGGINC_CY
# https://geocode.arcgis.com/arcgis/rest/services/World/GeocodeServer/findAddressCandidates?singleLine=watch&category=Factory&f=pjson
