require 'csv'

namespace :csv_load do
  task states: :environment do
    State.destroy_all
    ActiveRecord::Base.connection.reset_pk_sequence!('states')
    CSV.foreach('./db/data/states.csv', headers: true) do |row|
      state = State.create!(row.to_hash)
      p row
    end
    ActiveRecord::Base.connection.reset_pk_sequence!('states')
  end

  task counties: :environment do
    County.destroy_all
    ActiveRecord::Base.connection.reset_pk_sequence!('counties')
    CSV.foreach('./db/data/counties.csv', headers: true) do |row|
      county = County.create!(row.to_hash)
      county.county_details
      county.save
      puts row
    end
    ActiveRecord::Base.connection.reset_pk_sequence!('counties')
  end
  #
  # task counties_1: :environment do
  #   counter = 0
  #   CSV.foreach('./db/data/partial_counties1.csv', headers: true) do |row|
  #     new_county = County.find_or_create_by(row.to_hash)
  #     counter += 1
  #     if counter == 4
  #       sleep 1
  #       counter = 0
  #     end
  #
  #     new_county.establishment_count = new_county.jewelry_retailer_count
  #     new_county.save
  #   end
  #   ActiveRecord::Base.connection.reset_pk_sequence!('counties')
  # end
  #
  # task counties_2: :environment do
  #   counter = 0
  #   CSV.foreach('./db/data/partial_counties2.csv', headers: true) do |row|
  #     new_county = County.find_or_create_by(row.to_hash)
  #     counter += 1
  #
  #     if counter == 4
  #       sleep 1
  #       counter = 0
  #     end
  #
  #     new_county.establishment_count = new_county.jewelry_retailer_count2
  #     new_county.save
  #   end
  #   ActiveRecord::Base.connection.reset_pk_sequence!('counties')
  # end

  desc 'import all csv files'
  task all: :environment do
    tasks = [ 'csv_load:states',
              'csv_load:counties'
              ]
    tasks.each do |task|
      Rake::Task[task].invoke
    end

    ActiveRecord::Base.connection.tables.each do |t|
      ActiveRecord::Base.connection.reset_pk_sequence!(t)
    end
  end
end
