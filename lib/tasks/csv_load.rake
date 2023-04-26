require 'csv'

namespace :csv_load do
  task counties_1: :environment do
    counter = 0
    CSV.foreach('./db/data/partial_counties1.csv', headers: true) do |row|
      new_county = County.find_or_create_by(row.to_hash)
      counter += 1
      if counter == 4
        sleep 1
        counter = 0
      end

      new_county.establishment_count = new_county.industry_estab_count
      new_county.save
    end
    ActiveRecord::Base.connection.reset_pk_sequence!('counties')
  end

  task counties_2: :environment do
    counter = 0
    CSV.foreach('./db/data/partial_counties2.csv', headers: true) do |row|
      new_county = County.find_or_create_by(row.to_hash)
      counter += 1

      if counter == 4
        sleep 1
        counter = 0
      end

      new_county.establishment_count = new_county.industry_estab_count2
      new_county.save
    end
    ActiveRecord::Base.connection.reset_pk_sequence!('counties')
  end
end
