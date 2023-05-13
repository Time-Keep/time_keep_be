class CountySerializer
  def self.counties(data)
    {
      "counties": data.map do |x|
        {
          "state": x.state.name,
          "counties": {
            "county_name": x[:name],
            "average_wage": x[:annual_wages] / 12 / 52 / 40,
            "median_income": x[:median_income],
            "unemployment": x[:unemployment_rate],
            "annual_avg_establishment_count": x[:establishment_count],
            "combined_tax_rate": (x[:tax_rate].to_f + x.state.tax_rate.to_f).to_s,
            "total_annual_wages": x[:annual_wages]
            }
          }
      end
    }
  end
end
