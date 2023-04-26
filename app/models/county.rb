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
    self.establishment_count = EstabCountFetcher.fetch_count(self.lat, self.lon)
  end

  def industry_estab_count2
    self.establishment_count = EstabCountFetcher.fetch_count2(self.lat, self.lon)
  end
end
