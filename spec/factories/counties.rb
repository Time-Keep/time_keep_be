FactoryBot.define do
  factory :county do
    county { Faker::Name.first_name }
    county_ascii { Faker::Number.leading_zero_number(digits: 10) }
    county_full { county }
    county_fips { Faker::Number.number(digits: 4).to_s }
    state_id { Faker::Address.state_abbr }
    state_name { Faker::Address.state }
    lat { Faker::Address.latitude }
    lon { Faker::Address.longitude }
    population { Faker::Number.number(digits: 6).to_s }
    county_unemployment_rate { Faker::Number.decimal(l_digits: 1, r_digits: 1).to_s }
    state_unemployment { Faker::Number.decimal(l_digits: 1, r_digits: 1).to_s }
    county_median_income { Faker::Number.number(digits: 5).to_s }
    tax_rate { Faker::Number.decimal(l_digits: 1, r_digits: 1).to_s }
  end
end
