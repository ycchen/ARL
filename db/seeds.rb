# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


require 'faker'

Rake::Task['db:reset'].invoke


# pre-populate admin

u = User.create!(email: "admin@test.com", password: "foobar1234", 
			 password_confirmation: "foobar1234", display_name: "Admin")

# added 'admin' to the role table
u.add_role "admin"

# pre-populate inventory_status data
InventoryStatus.create!(name: "accessioned")
InventoryStatus.create!(name: "checked-in")
InventoryStatus.create!(name: "checked-out")
InventoryStatus.create!(name: "missing")
InventoryStatus.create!(name: "deaccessioned")

# pre-populate categories data
Category.create!(name: "Computer", description: "Computer related")
Category.create!(name: "Furniture", description: "Furniture related")
Category.create!(name: "Laboratory", description: "Laboratory related equipment")



# pre-populate locations data
# Location.create!(name: "Aberdeen Proving Ground", address: "Aberdeen Proving Ground",latitude: "39.472467", longitude: "-76.129966")
# Location.create!(name: "BUCKINGHAM FOUNTAIN – CHICAGO, ILLINOIS",address: "BUCKINGHAM FOUNTAIN, CHICAGO, ILLINOIS", latitude: "38.934583", longitude: "-77.428441")
Location.create!(name: "US Army Research Laboratory",address: "2800 Powder Mill Road, Adelphi, MD 20783, USA",latitude: "39.035865", longitude: "-76.95603899999999")
Location.create!(name: "ARL DSRC",address: "Aberdeen Boulevard, Aberdeen Proving Ground, MD 21005, USA",latitude: "39.486891", longitude: "-76.13923849999999")
Location.create!(name: "4603 Deer Creek Loop",address: "4603 Deer Creek Loop, Aberdeen Proving Ground, MD 21005, USA",latitude: "39.4855121", longitude: "-76.1542181")
Location.create!(name: "4600 Deer Creek Loop", address: "4603 Deer Creek Loop, Aberdeen Proving Ground, MD 21005, USA",latitude: "39.48551730000001", longitude: "-76.15425429999999")
Location.create!(name: "328 Hopkins Rd",address: "328 Hopkins Road, Aberdeen Proving Ground, MD 21005, USA", latitude: "39.477579", longitude: "-76.109241")
Location.create!(name: "309 Hopkins Rd",address: "309 Hopkins Road, Aberdeen Proving Ground, MD 21005, USA", latitude: "39.477579", longitude: "-76.109241")
Location.create!(name: "390 Hopkins Rd",address: "390 Hopkins Road, Aberdeen Proving Ground, MD 21005, USA", latitude: "39.477579", longitude: "-76.109241")
Location.create!(name: "459 Mulberry Point Rd",address: "459 Mulberry Point Road, Aberdeen Proving Ground, MD 21005, USA",latitude: "38.934583", longitude: "-77.42844099999999")

# Location.create!(name: "BUCKINGHAM FOUNTAIN in Chicago",address: "Clarence F. Buckingham Memorial Fountain, Chicago, IL 60604, USA",latitude: "41.875788", longitude: "-87.6189407")
# Location.create!(name: "GREENFIELD VILLAGE in DETROIT",address: "Greenfield Village, Dearborn, MI 48124, USA",latitude: "42.3053156", longitude: "-83.2246496")
# Location.create!(name: "BATTERY PARK in NEW YORK",address: "Battery Park, New York, NY 10004, USA",latitude: "40.7033262", longitude: "-74.0171778")
# Location.create!(name: "INDEPENDENCE HALL in PHILADELPHIA",address: "Philadelphia City Hall, Chestnut Street, Philadelphia, PA 19106, USA",latitude: "39.9523882", longitude: "-75.1640233")
# Location.create!(name: "STATUE OF LIBERTY in NEW YORK CITY",address: "Statue of Liberty National Monument, New York, NY 10004, USA",latitude: "40.6892494", longitude: "-74.04450039999999")
# Location.create!(name: "Thomas Jefferson Memorial",address: "Thomas Jefferson Memorial, 900 Ohio Drive Southwest, Washington, DC 20242, USA",latitude: "38.881454", longitude: "-77.036551")


# pre-populate Inventory data
100.times do |n|
	now = Date.today
	# case 
	# 	when n < 30
	# 		d = 100
	# 	when n > 30 && n < 50
	# 		d = 300
	# 	when n > 50 && n < 70
	# 		d = 600
	# 	when n > 70 && n < 90
	# 		d = 1200
	# 	when n > 90
	# 		d = 1500
	# 	else
	# 		d=2
	# end
	# cids =[]
	case  n
		when 0..30
			d = 100
			# cids.push(1,2)
		when 31..50
			d = 300
			# cids.push(1,3)
		when 51..70
			d = 600
			# cids.push(2,3)
		when 71..90
			d = 1200
			# cids.push(1,2,3)
		when 91..100
			d = 1500
			# cids.push(1,2,3)
		else
			d=2
			# cids.push(2,3)
		end
	Inventory.create!(
		stocknumber: "#{rand(8**8).to_s.rjust(8,'0').to_i}", 
		name: "Item #{n} " + Faker::Lorem.word, 
		description: Faker::Lorem.sentences.join(" "), 
		barcode: "#{rand(8**8).to_s.rjust(8,'0').to_i}", 
		category_ids: [Category.first.id.to_s, Category.last.id.to_s],
		purchase_date: "#{d}".to_i.days.ago)
		
end
# Faker::Lorem.words.join(" ")
# pre-populate User data

20.times do |n|
	endUser = User.create!(email: Faker::Internet.email, password: "foobar1234",
			password_confirmation: "foobar1234", display_name: Faker::Name.first_name)
	# added 'user' to the role table
	endUser.add_role "user"
end

u2 = User.create!(email: "yungchih_chen@yahoo.com", password: "foobar1234", 
			 password_confirmation: "foobar1234", display_name: "Yungchih")

# assigned admin role to the user
u2.add_role "admin"


