class County < ApplicationRecord
  validates :name,
            :county_full,
            :fips,
            :lat,
            :lon,
            :population,
            :unemployment_rate,
            :median_income,
            :tax_rate,
            presence: true
  validate :establishment_count,
           :annual_wages

  belongs_to :state

  def jewelry_retailer_count
    self.establishment_count = DetailFetcher.fetch_retailer_count(self.lat, self.lon)
  end

  def jewelry_retailer_count2
    self.establishment_count = DetailFetcher.fetch_retailer_count2(self.lat, self.lon)
  end

  def county_details
    details = DetailFetcher.fetch_county_stats(fip, st_fip)
    self.median_income = details[:median_income]
    self.unemployment_rate =
      details[:unemployment_rate] == 'Not yet reported' ? self.unemployment_rate : details[:unemployment_rate]
    self.establishment_count = details[:establishment_count]
    self.annual_wages = details[:average_industry_wage]
  end

  def fip_format
    self.fips.rjust(5, '0')
  end

  def fip
    fip_format[2..4]
  end

  def st_fip
    fip_format[0..1]
  end

  def extract_state_id
    self.fips.chop.chop.chop
  end
end
