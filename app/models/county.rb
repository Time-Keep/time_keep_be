class County < ApplicationRecord
  validates :county,
            :county_ascii,
            :county_full,
            :county_fips,
            :state_id,
            :state_name,
            :lat,
            :lon,
            :population,
            :county_unemployment_rate,
            :state_unemployment,
            :county_median_income,
            :tax_rate,
            presence: true
  validate :establishment_count

  def industry_estab_count
    self.establishment_count = DetailFetcher.fetch_estab_count(self.lat, self.lon)
  end

  def industry_estab_count2
    self.establishment_count = DetailFetcher.fetch_estab_count2(self.lat, self.lon)
  end

  def county_details
    details = DetailFetcher.fetch_county_stats(fip, st_fip)
  end

  def fip_format
    self.county_fips.rjust(5, '0')
  end

  def fip
    fip_format[2..4]
  end

  def st_fip
    fip_format[0..1]
  end
end
