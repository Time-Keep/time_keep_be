class CountySerializer
    def self.counties(data)
        {
            "counties": data.map do |x|
                {
                    "state": x[:state_name],
                    "counties": {
                        "county_name": x[:county],
                        "average_wage": x[:county_median_income],
                        "median_income": x[:county_median_income],
                        "unemployment": x[:county_unemployment_rate],
                        "annual_avg_establishment_count": x[:establishment_count],
                        "combined_tax_rate": x[:tax_rate],
                        "total_annual_wages": x[:county_median_income] 
                }  
                }
            end
        }
    end
end
