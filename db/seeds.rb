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

# pre-populate locations data
Location.create!(name: "ARL Buidling 4600",address: "ARL Buidling 4600", latitude: "39.507572", longitude: "-76.163051")
Location.create!(name: "Aberdeen Proving Ground", address: "Aberdeen Proving Ground",latitude: "39.472467", longitude: "-76.129966")
Location.create!(name: "DMS Herndon Office",address: "DMS Herndon Office", latitude: "38.934583", longitude: "-77.428441")
Location.create!(name: "DMS Aberdden Office",address: "DMS Aberdden Office",latitude: "39.494369", longitude: "-76.186745")
Location.create!(name: "White House", address: "White House, USA",latitude: "38.897683", longitude: "-77.036497")
Location.create!(name: "Chen's House",address: "1904 North Adams St. Arlington, VA 22201", latitude: "38.895555", longitude: "-77.089095")

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
	case  n
		when 0..30
			d = 100
		when 31..50
			d = 300
		when 51..70
			d = 600
		when 71..90
			d = 1200
		when 91..100
			d = 1500
		else
			d=2
	end
	Inventory.create!(
		stocknumber: "#{rand(8**8).to_s.rjust(8,'0').to_i}", 
		name: Faker::Lorem.words.join(" "), 
		description: Faker::Lorem.sentences.join(" "), 
		barcode: "#{rand(8**8).to_s.rjust(8,'0').to_i}", 
		purchase_date: "#{d}".to_i.days.ago)
end

# pre-populate User data

20.times do |n|
	endUser = User.create!(email: Faker::Internet.email, password: "foobar1234",
			password_confirmation: "foobar1234", display_name: Faker::Name.first_name)
	# added 'user' to the role table
	endUser.add_role "user"
end


