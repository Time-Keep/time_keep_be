# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
cmd = 'pg_restore --no-acl --no-owner -h localhost -U $(whoami) -d time_keep_be_development db/data/time_keep_be_development.pgdump'
puts 'Loading PostgreSQL Data dump into local database with command:'
puts cmd
system(cmd)
