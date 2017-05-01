# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
10.times do
	User.create(
		name: Faker::Name.name,
		email: Faker::Internet.email,
		password: Faker::Internet.password
	    )
end

user_ids = User.all.map {|u|u.id}

10.times do
  Rental.create(
  	user_id: user_ids.sample,
  	monthly_price: Faker::Number.number(4),
  	insurance: [true, false].sample,
  	rent_to_own: [true, false].sample
  	)
end

rental_ids = Rental.all.map {|r|r.id}

instrument_brands = {
"Keyboard" => ["Yamaha PSR-F51", "Casio CTK-1500", "Roland V-Combo", "Korg Pa4X 76"],
"Drumkit" => ["Pearl Export Series", "Tama Silverstar", "Gretsch Catalina Maple", "Odery Eyedentity Series"],
"Acoustic Guitar" => ["Seagull Guitars S6 Original", "Gibson 2016 Hummingbird Vintage", "Fender CD-60" "Taylor GS Mini "],
"Electric Guitar" =>["Fender American Special Stratocaster", "Gibson Les Paul Faded", "Ibanez Paul Stanley Signature"],
"Saxophone" => ["Selmer Mark VI", "Yamaha Custom Z", "Selmer Balanced Action", "Allora Student Series"],
"Flute" => ["Pearl Quantz Series", "Yamaha YFL-221", "Gemeinhardt Model 3OB", "Bentoni C"],
"Clarinet" => ["Etude Student Clarinet Model Ecl-100", "Buffet Crampon R13", "Yamaha Ycl-650", "Lazarro 50-BK"],
"Cello" => ["Cecilio CCO-500", "Cremona SC-200", "Merano’s Basic CL100-MP", "Yamaha SVC-110SK"],
"Violin" => ["Stentor 1500", "Cremona SV-500", "Mendini MV500", "Johannes Kohr K500"],
"Trumpet" => ["Allora Aatr-125 Series Classic", "Yamaha Ytr8335 Xeno", "Bach 180S Custom Stradivarius", "Bundy Btr-300 Series"],
"Trumbone" => ["Allora Student Series", "Yamaha Ysl620 Professional", "Kanstul 1555", "Cerveny Vfc-Sl6673R Series F"],
"French Horn" => ["Hans Hoyer 802", "Holton H179", "Yamaha YHR-871D Custom", "Wenzelmeinl Model 205gs"]
}
10.times do
	instrument_type = instrument_brands.keys.sample

  Instrument.create(
  	rental_id: rental_ids.sample,
  	instrument_type: instrument_type,
  	instrument_model: instrument_brands[instrument_type].sample
  	)
end