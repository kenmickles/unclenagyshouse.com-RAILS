# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

db = Rails.configuration.database_configuration[Rails.env]
puts `mysql -u #{db['username']} -p'#{db['password']}' #{db['database']} < #{Rails.root}/db/unclenagyshouse.sql`