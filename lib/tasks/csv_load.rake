require 'csv'

namespace :csv_load do
  task counties: :environment do
    CSV.foreach('./db/data/counties.csv', headers: true) do |row|
      County.find_or_create_by(row.to_hash)
    end
    ActiveRecord::Base.connection.reset_pk_sequence!('counties')
  end
end