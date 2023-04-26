# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
cmd = 'pg_restore --verbose --clean --no-acl --no-owner -h time_keep_be-db-1 -U postgres -d time_keep_be_development -W db/data/time_keep_be_development.pgdump'
puts 'Loading PostgreSQL Data dump into local database with command:'
puts cmd
system(cmd)

10.times do |i|
  County.create!(
    county: Faker::Name.first_name,
    county_ascii: Faker::Number.leading_zero_number(digits: 10),
    county_full: Faker::Name.first_name,
    county_fips: Faker::Number.number(digits: 4).to_s,
    state_id: Faker::Address.state_abbr,
    state_name: Faker::Address.state,
    lat: Faker::Address.latitude.to_s,
    lon: Faker::Address.longitude.to_s,
    population: Faker::Number.number(digits: 6).to_s,
    county_unemployment_rate: Faker::Number.decimal(l_digits: 1, r_digits: 1).to_s,
    state_unemployment: Faker::Number.decimal(l_digits: 1, r_digits: 1).to_s,
    county_median_income: Faker::Number.number(digits: 5).to_s,
    tax_rate: Faker::Number.decimal(l_digits: 1, r_digits: 1).to_s,
  )
end
