# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
10.times.do
  User.create(
  	email: 
  	password:
  	)

10.times.do
  Rental.create(
  	user_id:
  	monthly_price:
  	insurance:
  	rent_to_own:
  	)
end

10.times.do
  Instrument.create(
  	rental_id:
  	type:
  	accessories:
  	model: 
  	)
end