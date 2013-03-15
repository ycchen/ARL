# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Rake::Task['db:reset'].invoke

User.create!(email: "admin@test.com", password: "foobar1234", 
			 password_confirmation: "foobar1234", display_name: "Admin")

# pre-populate inventory_status data
InventoryStatus.create!(name: "accessioned")
InventoryStatus.create!(name: "checked-in")
InventoryStatus.create!(name: "checked-out")
InventoryStatus.create!(name: "missing")
InventoryStatus.create!(name: "deaccessioned")

# pre-populate locations data
Location.create!(name: "ARL Buidling 4600", latitude: "39.507572", longitude: "-76.163051")
Location.create!(name: "Aberdeen Proving Ground", latitude: "39.472467", longitude: "-76.129966")
Location.create!(name: "DMS Herndon Office", latitude: "38.934583", longitude: "-77.428441")
Location.create!(name: "DMS Aberdden Office", latitude: "39.494369", longitude: "-76.186745")
Location.create!(name: "White House", latitude: "38.897683", longitude: "-77.036497")
Location.create!(name: "Chen's House", latitude: "38.895555", longitude: "-77.089095")


