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
        :tax_rate, presence: true
end
